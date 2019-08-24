import 'package:colorie/models/log_item_model.dart';
import 'package:colorie/providers/log_provider.dart';
import 'package:colorie/screens/settings.dart';
import 'package:colorie/widgets/card_list.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.user}) : super(key: key);

  final String title;
  final user;

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

void _showAddItemBottomSheet(context) {
  showBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FeatherIcons.camera),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FeatherIcons.search),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Calories',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Grams',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.redAccent,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          label: Text("Cancel"),
                        ),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: Colors.blueAccent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.add_circle),
                        label: Text("Log Food"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

class _HomeState extends State<Home> {
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
                  icon: Icon(FeatherIcons.calendar),
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
              Consumer<LogProvider>(builder: (context, logProvider, __) {
                return Text(
                  "${logProvider.selectedDay.month}/${logProvider.selectedDay.day}/${logProvider.selectedDay.year}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                );
              }),
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
            child: Column(children: <Widget>[
          DrawerHeader(child: Consumer<LogProvider>(
            builder: (context, logProvider, __) {
              return Text('USER');
            },
          )),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Remove Ads'),
                leading: Icon(Icons.play_arrow),
                onTap: () {},
              ),
              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
            ],
          )),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 0.1,
          ),
          Container(
              padding: EdgeInsets.all(10),
              height: 100,
              child: ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.account_circle),
                  onTap: () {
                    Navigator.pop(context);
                  })),
        ])),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 60.0,
                ),
                child: Consumer<LogProvider>(
                  builder: (context, logProvider, __) {
                    return CardList(
                      list: logProvider.log,
                      user: widget.user,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            _showAddItemBottomSheet(context);
          },
          icon: Icon(Icons.add_circle),
          label: Text("Log Food"),
        ),
      ),
    );
  }
}
