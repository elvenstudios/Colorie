import 'package:colorie/models/local_storage.dart';
import 'package:colorie/models/log_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogProvider with ChangeNotifier {
  //LOCAL DB INIT
  initState() {
    getLogLocalDB();
  }

  final DatabaseHelper db = DatabaseHelper();

  void getLogLocalDB() async {
    _log = await db.getItems();
  }

  //LOG GETTER/SETTERS
  static Log _log = Log();

  Log get log => _log;

  set log(val) => _log = val;

  Log currentDayLog() {
    getLogLocalDB();
    Log log = Log();
    log.setLog(_log
        .getLog()
        .where((e) =>
            DateFormat('yyyy-MM-dd').format(DateTime.parse(e.createDateTime)) ==
            DateFormat('yyyy-MM-dd').format(_selectedDay))
        .toList());
    return log;
  }

  //delete from log based on ID
  void removeFromLog(item) async {
    var db = DatabaseHelper();
    db.deleteItem(item);
    setLog(await db.getItems());
    notifyListeners();
  }

  //add to log
  Future<void> addToLog(item, _selectedDay) async {
    await db.saveLog(
        item, DateFormat('yyyy-MM-dd').format(DateTime.parse(_selectedDay)));
    setLog(await db.getItems());
    notifyListeners();
  }

  Future<void> setLog(newLog) async {
    _log = newLog;
    notifyListeners();
  }

  //DATETIME GETTER/SETTERS
  static final DateTime _today = DateTime.now();
  static DateTime _selectedDay = _today;

  //get current day
  DateTime get today => _today;

  DateTime get selectedDay => _selectedDay;

  set selectedDay(val) {
    _selectedDay = val;
    notifyListeners();
  }

  Future<Null> setDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: today.subtract(Duration(days: 365 * 2)),
      lastDate: today.add(Duration(days: 365 * 2)),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != _selectedDay) {
      _selectedDay = picked;
      notifyListeners();
    }
  }

  //set to today
  void setToCurrentDay() {
    selectedDay = today;
    notifyListeners();
  }

  //increment day
  void incrementDay() {
    selectedDay = selectedDay.add(Duration(days: 1));
    notifyListeners();
  }

  //decrement day
  void decrementDay() {
    selectedDay = selectedDay.subtract(Duration(days: 1));
    notifyListeners();
  }
}
