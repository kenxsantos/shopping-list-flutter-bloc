import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ShoppingDatabase {
  static final ShoppingDatabase instance = ShoppingDatabase._init();

  static Database? _database;
  ShoppingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    return await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'shopping.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE shopping (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            tag TEXT,
            isFavorite INTEGER
          )
        ''');
      },
    );
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
