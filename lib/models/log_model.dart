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

  getGreenPercentage() {
    num filterLength = _log.where((logItem) => logItem.getColorFromDensity() == 'green').length;

    return filterLength / this.length();

  }

  getYellowPercentage() {
    num filterLength = _log.where((logItem) => logItem.getColorFromDensity() == 'yellow').length;

    return filterLength / this.length();
  }

  getOrangePercentage() {
    num filterLength = _log.where((logItem) => logItem.getColorFromDensity() == 'orange').length;

    return filterLength / this.length();
  }

  getRedPercentage() {
    num filterLength = _log.where((logItem) => logItem.getColorFromDensity() == 'red').length;

    return filterLength / this.length();
  }

  num getTotalCalories() {
    num sum = 0;
    _log.forEach((e){sum += e.calories;});
    return sum;
  }

}