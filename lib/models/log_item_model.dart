///
/// Log Item class
/// a single log item
///
class LogItem {
  int _id;
  String _foodName;
  String _calories;
  String _grams;
  String _create_dt_tm;

  LogItem(Map<String, String> map,
      {int id,
      String foodName,
      String calories,
      String grams,
      String create_dt_tm})
      : _id = id,
        _foodName = foodName,
        _calories = calories,
        _grams = grams,
        _create_dt_tm = create_dt_tm;

  LogItem.map(dynamic obj) {
    this._foodName = obj["foodName"];
    this._calories = obj["calories"];
    this._grams = obj["grams"];
    this._create_dt_tm = obj["create_dt_tm"];
  }

  int get id => _id;

  String get foodName => _foodName;

  String get calories => _calories;

  String get grams => _grams;

  String get create_dt_tm => _create_dt_tm;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["foodName"] = _foodName;
    map["calories"] = _calories;
    map["grams"] = _grams;
    map["create_dt_tm"] = _create_dt_tm;
    return map;
  }

  void setUserId(int id) {
    this._id = id;
  }

  /*
   * Calculates calorie density based on calories and grams
   */
  double calculateDensity() {
    return int.parse(this._calories) / int.parse(this._grams);
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
