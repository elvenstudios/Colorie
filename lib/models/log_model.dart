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
    return _log.where((logItem) => logItem.getColorFromDensity() == 'green');
  }

  getYellowLogItems() {
    return _log.where((logItem) => logItem.getColorFromDensity() == 'yellow');
  }

  getOrangeLogItems() {
    return _log.where((logItem) => logItem.getColorFromDensity() == 'orange');
  }

  getRedLogItems() {
    return _log.where((logItem) => logItem.getColorFromDensity() == 'red');
  }

  num getTotalCalories() {
    num sum = 0;
    _log.forEach((e) {
      sum += e.calories;
    });
    return sum;
  }
}
