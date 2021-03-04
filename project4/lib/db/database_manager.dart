import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'journalEntryDTO.dart';

const SELECT_PATH = 'assets/select_schema.txt';
const INSERT_PATH = 'assets/insert_schema.txt';
const CREATE_PATH = 'assets/create_schema.txt'; 

class DatabaseManager {
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';

  static DatabaseManager _instance;
  final Database db;

  DatabaseManager._({Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    
    return _instance;
  }

  static Future initialize() async{
    String sqlCreate = await rootBundle.loadString(CREATE_PATH); 
    Database db = await openDatabase(
      DATABASE_FILENAME,
      version: 1, 
      onCreate: (Database db, int version) async {
        createTables(db, sqlCreate);
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({JournalEntryDTO dto}) {
    db.transaction((txn) async {
      String sqlInsert = await rootBundle.loadString(INSERT_PATH); 
      await txn.rawInsert(
        sqlInsert,
        [dto.title, dto.body, dto.rating, dto.date.toString()],
      );
    });
  }

  Future<List<Map<String, dynamic>>> selectEntries() async{
    String sqlSelect = await rootBundle.loadString(SELECT_PATH); 
    return db.rawQuery(sqlSelect);
  }
}