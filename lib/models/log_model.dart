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
    return green / this.getTotalCalories();
  }

  double getYellowPercentageDecimal() {
    double yellow = _log
        .where((logItem) => logItem.getColorFromDensity() == 'yellow')
        .fold(0, (curr, next) => curr + next.calories);
    return yellow / this.getTotalCalories();
  }

  double getOrangePercentageDecimal() {
    double orange = _log
        .where((logItem) => logItem.getColorFromDensity() == 'orange')
        .fold(0, (curr, next) => curr + next.calories);
    return orange / this.getTotalCalories();
  }

  double getRedPercentageDecimal() {
    double red = _log
        .where((logItem) => logItem.getColorFromDensity() == 'red')
        .fold(0, (curr, next) => curr + next.calories);
    return red / this.getTotalCalories();
  }

  String getGreenPercentage() {
    if ((getGreenPercentageDecimal() * 100).isNaN) return '0%';
    return "${(getGreenPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getYellowPercentage() {
    if ((getYellowPercentageDecimal() * 100).isNaN) return '0%';
    return "${(getYellowPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getOrangePercentage() {
    if ((getOrangePercentageDecimal() * 100).isNaN) return '0%';
    return "${(getOrangePercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getRedPercentage() {
    if ((getRedPercentageDecimal() * 100).isNaN) return '0%';
    return "${(getRedPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  getGreenLogItems() {
    var greenLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'green')
        .toList();
    return greenLog;
  }

  getYellowLogItems() {
    var yellowLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'yellow')
        .toList();
    return yellowLog;
  }

  getOrangeLogItems() {
    var orangeLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'orange')
        .toList();
    return orangeLog;
  }

  getRedLogItems() {
    var redLog = _log
        .where((logItem) => logItem.getColorFromDensity() == 'red')
        .toList();
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
