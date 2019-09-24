import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'log_item_model.dart';
import 'log_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Log(id INTEGER PRIMARY KEY,foodName TEXT,calories REAL ,grams REAL ,createDateTime TEXT)");
  }

  Future<int> saveLog(LogItem item,day) async {
    item.createDateTime=day;
    var dbClient = await db;
    int res = await dbClient.insert("Log", item.map);
    return res;
  }

  Future<Log> getItems() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Log');
    List<LogItem> items = [];
    for (int i = 0; i < list.length; i++) {
      var item = new LogItem(list[i]["foodName"], list[i]["calories"],
          list[i]["grams"], list[i]["createDateTime"]);
      item.setDatabaseFieldID(list[i]["id"]);
      items.add(item);
    }
    Log log = Log();
    log.setLog(items);
    return log;
  }

  Future<int> deleteItem(id) async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('DELETE FROM Log WHERE id = ?', [id]);
    return res;
  }

//  Future<bool> update(LogItem item) async {
//    var dbClient = await db;
//    int res = await dbClient.update("Log", item.toMap(),
//        where: "id = ?", whereArgs: <int>[item._id]);
//    return res > 0 ? true : false;
//  }
}
