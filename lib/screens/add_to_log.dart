import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddToLogScreen extends StatefulWidget {
  final user;
  AddToLogScreen({Key key, this.user}) : super(key: key);

  @override
  _AddToLogScreenState createState() => _AddToLogScreenState();
}

class _AddToLogScreenState extends State<AddToLogScreen> {
  final calController = TextEditingController();
  final gramsController = TextEditingController();
  final foodNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    calController.dispose();
    gramsController.dispose();
    foodNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = new DateTime.now();
    String formattedToday = "${today.month}/${today.day}/${today.year}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Log Food',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: foodNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: InputBorder.none,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: calController,
              decoration: InputDecoration(
                labelText: 'Calories',
                border: InputBorder.none,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: gramsController,
              decoration: InputDecoration(
                labelText: 'Grams',
                border: InputBorder.none,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton.extended(
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    Firestore.instance
                        .collection('logs')
                        .document(widget.user.email)
                        .collection('log')
                        .add(
                      {
                        'name': foodNameController.text,
                        'calories': int.parse(calController.text),
                        'grams': int.parse(gramsController.text),
                        'date': formattedToday,
                      },
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.add_circle),
                  label: Text("Log Food"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
