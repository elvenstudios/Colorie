import 'package:flutter/material.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:colorie/widgets/card_list.dart';
import 'package:colorie/models/log_item_model.dart';
import 'package:colorie/models/log_model.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  final List rawList = [
    {
      'calories': 100.0,
      'grams': 200.0,
      'name': 'Beans'
    },
    {
      'calories': 200.0,
      'grams': 210.0,
      'name': 'Corn'
    },
    {
      'calories': 200.0,
      'grams': 210.0,
      'name': 'Corn'
    },
    {
      'calories': 200.0,
      'grams': 110.0,
      'name': 'Corn'
    },
    {
      'calories': 200.0,
      'grams': 14.0,
      'name': 'Corn'
    },
    {
      'calories': 100.0,
      'grams': 40.0,
      'name': 'Corn'
    }
  ];

  LogItem convertToLogItem(item) {
    return new LogItem(calories: item['calories'], grams: item['grams']);
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    Log formattedList = new Log();

    widget.rawList.forEach((item) => {
      formattedList.add(widget.convertToLogItem(item))
    });

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
            CirclePercentage(totalCalories: formattedList.getTotalCalories(),),
            CardList(list: formattedList,),
          ],
        ),
      ),
    );
  }
}
