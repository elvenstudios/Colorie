import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomModal extends StatefulWidget {
  final user;
  BottomModal({Key key, this.user}) : super(key: key);

  @override
  _BottomModalState createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
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

    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: foodNameController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Food Name'),
          ),
          TextField(
            controller: calController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Calories'),
          ),
          TextField(
            controller: gramsController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Grams'),
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
                },
                icon: Icon(Icons.add_circle),
                label: Text("Log Food"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
