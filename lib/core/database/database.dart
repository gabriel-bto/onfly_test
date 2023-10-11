import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB istance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await initDatabase();
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'expense.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(db, version) async {
    await db.execute(_expense);
  }

  String get _expense => '''
    CREATE TABLE expense (
      id VARCHAR(50) PRIMARY KEY,
      description VARCHAR(500),
      expenseDate DATETIME,
      amount DOUBLE,
      latitude VARCHAR(20),
      longitude VARCHAR(20),
      isCreate INTEGER(1) DEFAULT 0,
      isUpdate INTEGER(1) DEFAULT 0,
      isRemove INTEGER(1) DEFAULT 0,
    )
  ''';
}
