

///
/// Log Item class
/// a single log item
///
class LogItem {

  final num calories;
  final num grams;

  LogItem({this.calories, this.grams});

  /*
   * Calculates calorie density based on calories and grams
   */
  double calculateDensity() {
    return this.calories / this.grams;
  }

  /*
   * Calculates a color code based on a given calorie density
   */
  String getColorFromDensity() {
    double density = calculateDensity();

    if (density <= 0.6) {
      return "green";
    }

    if (density <= 1.5) {
      return "yellow";
    }

    if (density <= 3.8) {
      return "orange";
    }

    return "red";
  }

}