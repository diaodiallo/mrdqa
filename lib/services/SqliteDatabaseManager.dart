import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Assessment.dart';

class SqliteDatabaseManager {
  static final DATABASE_NAME = "mdqa_dev.db";
  static final DATABASE_VERSION = 1;

  //Country Table

  //static final DATABASE_TABLE = "assessment";
  //static final ASSESSMENT_ID = 'id';
  //static final FACILITY_ID = 'facility_id';
  //static final ASSESSMENT_DATA = 'assessment_data';

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
    print('*************');
    print(path);
    print('*************');
    return await openDatabase(path,
        version: DATABASE_VERSION,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    //For testing purposes ONLY
    print('CREATIN TABLES');
    await db.execute('''
          CREATE TABLE ASSESSMENTS (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            ASSESSMENT_ID TEXT NOT NULL,
            DATA TEXT NOT NULL
          )
          ''');

    /*await db.execute('''
          CREATE TABLE COUNTRIES (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            COUNTRY_ID TEXT NOT NULL,
            NAME TEXT NOT NULL
          )
          ''');

    await db.execute('''
      CREATE TABLE FACILITIES (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        FACILITY_ID TEXT NOT NULL,
        COUNTRY_ID TEXT NOT NULL,
        TOWN_VILLAGE TEXT NOT NULL,
        DISTRICT TEXT NOT NULL,
        REGION TEXT NOT NULL,
        FACILITY_TYPE_ID TEXT NOT NULL,
        PHONE TEXT NOT NULL,
        EMAIL TEXT NOT NULL
      )
      ''');*/
  }
  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database db = await instance.database;
    return await db.insert(table, data);
  }
}
