import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _databaseName = 'QRCode.db';
  static const int _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path =
        join((await getApplicationDocumentsDirectory()).path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: createDataBaseQR);
  }

  Future<void> createDataBaseQR(Database db, int version) async {
    await db.execute('''
      CREATE TABLE QRCODES (
        ID INTEGER PRIMARY KEY,
        DATA TEXT,
        DATE TEXT,
        COLOR TEXT
      )
    ''');
  }

  Future<void> createDataBaseUser(Database db, int version) async {
    await db.execute('''
      CREATE TABLE USER (
        ID INTEGER PRIMARY KEY,
        NAME TEXT,
        LASTNAME TEXT,
        POSITION TEXT,
        EMAIL TEXT
      )
    ''');
  }

  Future<void> createDataBaseSettigns(Database db, int version) async {
    await db.execute('''
      CREATE TABLE SETTINGS (
        CONTINUSSCAN INTEGER,
        DUPLICATEBARCODE INTEGER,
        SCANBYHAND INTEGER,
        MUTE INTEGER,
        VIBRATION INTEGER,
        COPYTOCLIPBOARD INTEGER
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row, String table) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsOrderByDate(
      String table) async {
    Database db = await instance.database;
    return await db.query(table, orderBy: 'DATE');
  }

  Future<List<Map<String, dynamic>>> querryAllRowsUser() async {
    Database db = await instance.database;
    return await db.query('USER');
  }

  Future<List<Map<String, dynamic>>> queryNameById() async {
    Database db = await instance.database;
    return await db.query('USER',
        columns: ['NAME'], where: 'ID = ?', whereArgs: [1]);
  }
}
