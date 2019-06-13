import 'package:flutter/material.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:colorie/widgets/card_list.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
            child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Remove Ads"),
              leading: Icon(Icons.play_arrow),
            )
          ],
        )),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CirclePercentage(),
            CardList(),
          ],
        ),
      ),
    );
  }
}
