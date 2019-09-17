///
/// Log Item class
/// a single log item
///
class LogItem {
  int _id;
  String _foodName;
  num _calories;
  num _grams;
  String _createDateTime;

  LogItem(this._foodName, this._calories, this._grams, this._createDateTime);

  int get id => _id;

  String get foodName => _foodName;

  num get calories => _calories;

  num get grams => _grams;

  String get createDateTime => _createDateTime;

  LogItem.map(dynamic obj) {
    this._foodName = obj["foodName"];
    this._calories = obj["calories"];
    this._grams = obj["grams"];
    this._createDateTime = obj["createDateTime"];
  }

  Map<String, dynamic> get map {
    return {
      "foodName": _foodName,
      "calories": _calories,
      "grams": _grams,
      "createDateTime": createDateTime,
    };
  }

  /*
   * Needed to set database ID to log model to allow item to be deleted from DB
   */
  void setDatabaseFieldID(int id) {
    this._id = id;
  }


  set createDateTime(date) {
    this._createDateTime = date;
  }

  /*
   * Calculates calorie density based on calories and grams
   */
  double calculateDensity() {
    return this._calories / this._grams;
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
