import 'package:colorie/models/log_item_model.dart';
import 'package:colorie/providers/log_provider.dart';
import 'package:colorie/screens/add_to_log.dart';
import 'package:colorie/widgets/card_list.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.user}) : super(key: key);

  final String title;
  final user;
  final DateTime today = new DateTime.now();

  LogItem convertToLogItem(item) {
    return new LogItem({
      'calories': item['calories'],
      'grams': item['grams'],
      'name': item['name'],
      'ref': item
    });
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

  void _goToAddItemScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddToLogScreen(user: widget.user, selectedDay: selectedDay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => LogProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Consumer<LogProvider>(
              builder: (context, logProvider, __) {
                return IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: logProvider.setToCurrentDay,
                );
              },
            ),
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleSpacing: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<LogProvider>(
                builder: (context, logProvider, __) {
                  return MaterialButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: logProvider.decrementDay,
                  );
                },
              ),
              Text(
                "${selectedDay.month}/${selectedDay.day}/${selectedDay.year}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Consumer<LogProvider>(
                builder: (context, logProvider, __) {
                  return MaterialButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: logProvider.incrementDay,
                  );
                },
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
                enabled: false,
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Consumer<LogProvider>(
                builder: (context, logProvider, __) {
                  return CirclePercentage(
                    totalCalories: logProvider.log.getTotalCalories(),
                  );
                },
              ),
              Consumer<LogProvider>(
                builder: (context, logProvider, __) {
                  return CardList(
                    list: logProvider.log,
                    user: widget.user,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blueAccent,
          onPressed: _goToAddItemScreen,
          icon: Icon(Icons.add_circle),
          label: Text("Log Food"),
        ),
      ),
    );
  }
}
