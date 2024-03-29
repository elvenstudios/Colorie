import './log_item_model.dart';

///
/// Log class
/// A list of log items
///
class Log {
  List<LogItem> _log = [];

  Log({List<LogItem> log});

  add(item) {
    _log.add(item);
  }

  remove(item) {
    _log.remove(item);
  }

  length() {
    return _log.length;
  }

  getLog() {
    return _log;
  }

  setLog(List<LogItem> list) {
    _log = list;
  }

  double getGreenPercentageDecimal() {
    double green = _log
        .where((logItem) => logItem.getColorFromDensity() == 'green')
        .fold(0, (curr, next) => curr + next.calories);
    print('getGreenPercentageDecimal $green');
    return green / this.getTotalCalories();
  }

  double getYellowPercentageDecimal() {
    double yellow = _log
        .where((logItem) => logItem.getColorFromDensity() == 'yellow')
        .fold(0, (curr, next) => curr + next.calories);
    print('getYellowPercentageDecimal $yellow');
    return yellow / this.getTotalCalories();
  }

  double getOrangePercentageDecimal() {
    double orange = _log
        .where((logItem) => logItem.getColorFromDensity() == 'orange')
        .fold(0, (curr, next) => curr + next.calories);
    print('getOrangePercentageDecimal $orange');
    return orange / this.getTotalCalories();
  }

  double getRedPercentageDecimal() {
    double red = _log
        .where((logItem) => logItem.getColorFromDensity() == 'red')
        .fold(0, (curr, next) => curr + next.calories);
    print('getRedPercentageDecimal $red');
    return red / this.getTotalCalories();
  }

  String getGreenPercentage() {
    print('getGreenPercentageDecimal $getGreenPercentageDecimal()');
    if ((getGreenPercentageDecimal() * 100).isNaN) return '0%';
    return "${(getGreenPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getYellowPercentage() {
    print('getYellowPercentage $getYellowPercentage()');
    if ((getYellowPercentageDecimal() * 100).isNaN) return '0%';
    return "${(getYellowPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getOrangePercentage() {
    print('getOrangePercentage $getOrangePercentage()');
    if ((getOrangePercentageDecimal() * 100).isNaN) return '0%';
    return "${(getOrangePercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getRedPercentage() {
    print('getRedPercentage $getRedPercentage()');
    if ((getRedPercentageDecimal() * 100).isNaN) return '0%';
    return "${(getRedPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  getGreenLogItems() {
    var greenLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'green')
        .toList();
    LogItem newItem = LogItem('Green is good', 0, 0, '0');
    greenLog.insert(0, newItem);
    return greenLog;
  }

  getYellowLogItems() {
    var yellowLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'yellow')
        .toList();
    LogItem newItem = LogItem('Yellow is kinda good', 0, 0, '0');
    yellowLog.insert(0, newItem);
    return yellowLog;
  }

  getOrangeLogItems() {
    var orangeLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'orange')
        .toList();
    LogItem newItem = LogItem('Orange is kinda bad', 0, 0, '0');
    orangeLog.insert(0, newItem);
    return orangeLog;
  }

  getRedLogItems() {
    var redLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'red')
        .toList();
    LogItem newItem = LogItem('Red is bad', 0, 0, '0');
    redLog.insert(0, newItem);
    return redLog;
  }

  num getTotalCalories() {
    num sum = 0;
    _log.forEach((e) {
      sum += e.calories;
    });
    return sum;
  }
}
