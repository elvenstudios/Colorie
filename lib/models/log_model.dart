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
    return ((getGreenPercentageDecimal() * 100).isNaN)
        ? '0%'
        : "${(getGreenPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getYellowPercentage() {
    return ((getYellowPercentageDecimal() * 100).isNaN)
        ? '0%'
        : "${(getYellowPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getOrangePercentage() {
    return ((getOrangePercentageDecimal() * 100).isNaN)
        ? '0%'
        : "${(getOrangePercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  String getRedPercentage() {
    return ((getRedPercentageDecimal() * 100).isNaN)
        ? '0%'
        : "${(getRedPercentageDecimal() * 100).toStringAsFixed(1)}%";
  }

  getGreenLogItems() {
    return _log
        .where((logItem) => logItem.getColorFromDensity() == 'green')
        .toList();
  }

  getYellowLogItems() {
    return _log
        .where((logItem) => logItem.getColorFromDensity() == 'yellow')
        .toList();
  }

  getOrangeLogItems() {
    return _log
        .where((logItem) => logItem.getColorFromDensity() == 'orange')
        .toList();
  }

  getRedLogItems() {
    return _log
        .where((logItem) => logItem.getColorFromDensity() == 'red')
        .toList();
  }

  num getTotalCalories() {
    num sum = 0;
    _log.forEach((e) {
      sum += e.calories;
    });
    return sum;
  }
}
