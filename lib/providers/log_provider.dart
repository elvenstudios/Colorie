import 'package:colorie/models/local_storage.dart';
import 'package:colorie/models/log_model.dart';
import 'package:flutter/material.dart';

class LogProvider with ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper();
  static Log _log = Log();

  void get getLogLocalDB async {
    _log = await db.getItems();
    print("Local DB loaded");
    print(_log.length());
  }

  static final DateTime _today = DateTime.now();
  static DateTime _selectedDay = _today;

  //get current day
  DateTime get today => _today;

  DateTime get selectedDay => _selectedDay;



  set selectedDay(val){
    _selectedDay = val;
    notifyListeners();
  }

  Log get log => _log;

  set log(val) => _log = val;

  //set to today
  void setToCurrentDay() {
    print('set to current');
    selectedDay = today;
    print(selectedDay);
  }

  //increment day
  void incrementDay() {
    print('increment');
    selectedDay = selectedDay.add(Duration(days: 1));
    print(selectedDay);
  }

  //decrement day
  void decrementDay() {
    print('decrement');
    selectedDay = selectedDay.subtract(Duration(days: 1));
    print(selectedDay);
  }

  //delete from log based on ID
  void removeFromLog(item) {
    print('removeFromLog');
    var db = new DatabaseHelper();
    db.deleteItem(item);
  }

  //add to log
  void addToLog(item) {
    print('addToLog');
    db.saveLog(item);
  }
}
