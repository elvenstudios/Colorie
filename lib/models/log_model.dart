import './log_item_model.dart';

///
/// Log class
/// A list of log items
///
class Log {
  List<LogItem> _log = [];

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

  double getGreenPercentage() {
    double green = _log.where((logItem) => logItem.getColorFromDensity() == 'green').fold(0, (curr, next) => curr + int.parse(next.calories));
    return green / this.getTotalCalories();

  }

  getYellowPercentage() {
    double yellow = _log.where((logItem) => logItem.getColorFromDensity() == 'yellow').fold(0, (curr, next) => curr +int.parse( next.calories));

    return yellow / this.getTotalCalories();
  }

  getOrangePercentage() {
    double orange = _log.where((logItem) => logItem.getColorFromDensity() == 'orange').fold(0, (curr, next) => curr + int.parse(next.calories));

    return orange / this.getTotalCalories();
  }

  getRedPercentage() {
    double red = _log.where((logItem) => logItem.getColorFromDensity() == 'red').fold(0, (curr, next) => curr + int.parse(next.calories));

    return red / this.getTotalCalories();
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
    _log.forEach((e){sum += int.parse(e.calories);});
    return sum;
  }

}