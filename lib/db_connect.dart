import 'dart:io';

import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";

class DBConnect {

  static Database _database;

  DBConnect._();
  static final DBConnect db = DBConnect._();

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ExpenseDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      String createTaskTable = "CREATE TABLE task ("
          + "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          + "description TEXT,"
          + "status TEXT,"
          + ")";

      var batch = db.batch();
      batch.execute(createTaskTable);
      await batch.commit(noResult: true);

    });
  }

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future close() async => db.close();

}
