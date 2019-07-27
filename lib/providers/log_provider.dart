import 'package:colorie/models/log_model.dart';
import 'package:flutter/material.dart';

class LogProvider with ChangeNotifier {
  Log _log = new Log();
  final DateTime _today = DateTime.now();


  //get current day
  DateTime get today => _today;

  //set to today
  void setToCurrentDay() {
    print('set to current');
  }

  //increment day
  void incrementDay() {
    print('increment');
  }

  //decrement day
  void decrementDay() {
    print('decrement');
  }

  //get list of log items
  Log get log => _log;

  //delete from log
  void removeFromLog() {
    print('removeFromLog');
  }

  //add to log
  void addToLog() {
    print('addToLog');
  }

}