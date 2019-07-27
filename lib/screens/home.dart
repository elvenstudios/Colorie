import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorie/models/log_item_model.dart';
import 'package:colorie/models/log_model.dart';
import 'package:colorie/screens/add_to_log.dart';
import 'package:colorie/widgets/card_list.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.user}) : super(key: key);

  final String title;
  final user;
  final DateTime today = new DateTime.now();

  LogItem convertToLogItem(item) {
    return new LogItem(
        calories: item['calories'],
        grams: item['grams'],
        name: item['name'],
        ref: item);
  }

  @override
  _HomeState createState() => _HomeState();
}

getUserName(name) {
  if (name != null) {
    return name;
  }
  return 'User';
}

class _HomeState extends State<Home> {
  DateTime selectedDay = new DateTime.now();

  void _addItemToLog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddToLogScreen(user: widget.user, selectedDay: selectedDay),
      ),
    );
  }

  _incrementDay() {
    if ((widget.today.day == selectedDay.day) &&
        (widget.today.month == selectedDay.month) &&
        (widget.today.year == selectedDay.year)) {
      return false;
    } else {
      setState(() {
        selectedDay = selectedDay.add(new Duration(days: 1));
      });
    }
  }

  _decrementDay() {
    setState(() {
      selectedDay = selectedDay.subtract(new Duration(days: 1));
    });
  }

  _setToCurrentDay() {
    setState(() {
      selectedDay = widget.today;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedToday =
        "${selectedDay.month}/${selectedDay.day}/${selectedDay.year}";

    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: _setToCurrentDay,
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        titleSpacing: 0.0,
        title: Row(
          children: <Widget>[
            MaterialButton(
              child: Icon(Icons.arrow_back),
              onPressed: _decrementDay,
            ),
            Text(
              "${selectedDay.month}/${selectedDay.day}/${selectedDay.year}",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            MaterialButton(
              child: Icon(Icons.arrow_forward),
              onPressed: _incrementDay,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                getUserName(widget.user.email),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.account_circle),
              onTap: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
              },
            ),
            ListTile(
              title: Text("Remove Ads"),
              leading: Icon(Icons.play_arrow),
            )
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 60.0,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('logs')
                    .document(widget.user.email)
                    .collection('log')
                    .where('date', isEqualTo: formattedToday)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      Log formattedList = new Log();

                      snapshot.data.documents.forEach((item) =>
                          {formattedList.add(widget.convertToLogItem(item))});

                      return SafeArea(
                        child: Column(
                          children: <Widget>[
                            CirclePercentage(
                              totalCalories: formattedList.getTotalCalories(),
                            ),
                            CardList(
                              list: formattedList,
                              user: widget.user,
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: _addItemToLog,
        icon: Icon(Icons.add_circle),
        label: Text("Log Food"),
      ),
    );
  }
}
