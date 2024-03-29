import 'package:colorie/models/log_item_model.dart';
import 'package:colorie/providers/log_provider.dart';
import 'package:colorie/screens/settings.dart';
import 'package:colorie/widgets/card_list.dart';
import 'package:colorie/widgets/circle_percentage.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

void _showAddItemBottomSheet(context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController gramsController = TextEditingController();

  //DEFAULT VALUES FOR TESTING
  nameController.text = 'Lettuce';
  caloriesController.text = '20';
  gramsController.text = '600';

  showBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (_) => LogProvider()),
          ],
          child: Consumer<LogProvider>(builder: (context, logProvider, __) {
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
                              controller: nameController,
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
                              controller: caloriesController,
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
                              controller: gramsController,
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
                            onPressed: () async {
                              LogItem item = LogItem(
                                  nameController.text.toString(),
                                  int.tryParse(caloriesController.text) ?? 0,
                                  int.tryParse(gramsController.text) ?? 0,
                                  DateTime.now().toString());

                              await logProvider.addToLog(
                                  item,
                                  DateFormat('yyyy-MM-dd')
                                      .format(logProvider.selectedDay));
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
          }),
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleSpacing: 0.0,
          centerTitle: true,
          actions: <Widget>[
            MaterialButton(
              child: Icon(
                Icons.settings,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            )
          ],
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
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
                return MaterialButton(
                  child: Text(
                    "${logProvider.selectedDay.month}/${logProvider.selectedDay.day}/${logProvider.selectedDay.year}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => logProvider.setDatePicker(context),
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
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 65.0, right: 65.0),
                child: Consumer<LogProvider>(
                  builder: (context, logProvider, __) {
                    return CirclePercentage(
                        totalCalories:
                            logProvider.currentDayLog().getTotalCalories(),
                        context: context);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 60.0,
                ),
                child: Consumer<LogProvider>(
                  builder: (context, logProvider, __) {
                    return CardList(list: logProvider.currentDayLog());
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
