import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Assessment.dart';

class SqliteDatabaseManager {
  static final DATABASE_NAME = "mdqa.db";
  static final DATABASE_VERSION = 1;
  static final DATABASE_TABLE = "assessment";
  static final ASSESSMENT_ID = 'id';
  static final FACILITY_ID = 'facility_id';
  static final ASSESSMENT_DATA = 'assessment_data';

  SqliteDatabaseManager._privateConstructor();
  static final SqliteDatabaseManager instance = SqliteDatabaseManager._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), DATABASE_NAME);
    print(path);
    return await openDatabase(path,
        version: DATABASE_VERSION,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $DATABASE_TABLE (
            $ASSESSMENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $FACILITY_ID TEXT NOT NULL,
            $ASSESSMENT_DATA TEXT NOT NULL
          )
          ''');
  }
  Future<int> insert(Assessment assessment) async {
    Database db = await instance.database;
    return await db.insert(DATABASE_TABLE, {'FACILITY_ID': assessment.facility_id, 'ASSESSMENT_DATA': assessment.assessment_data});
  }
}
