import 'package:flutter/material.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:colorie/widgets/card_list.dart';
import 'package:colorie/models/log_item_model.dart';
import 'package:colorie/models/log_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title, this.user }) : super(key: key);

  final String title;
  final user;

  LogItem convertToLogItem(item) {
    return new LogItem(calories: item['calories'], grams: item['grams']);
  }

  @override
  _HomeState createState() => _HomeState();
}

getUserName(name) {
  if(name != null) {
    return name;
  } return 'User';
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: new BoxDecoration(color: Colors.greenAccent),
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
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('log').snapshots(),
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
                        CardList(list: formattedList),
                      ],
                    ));
                }
              },
            )),
      ),
    );
  }
}
