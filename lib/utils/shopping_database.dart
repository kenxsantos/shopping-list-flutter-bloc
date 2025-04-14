import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ShoppingDatabase {
  static final ShoppingDatabase instance = ShoppingDatabase._init();

  static Database? _database;
  ShoppingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'shopping.db');

      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
        onUpgrade: _upgradeDB,
        onDowngrade: _downgradeDB,
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow; // Bubble up the error
    }
  }

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE shopping (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          tag TEXT NOT NULL,
          isFavorite INTEGER NOT NULL DEFAULT 0
        )
      ''');
    } catch (e) {
      print('Error creating table: $e');
      rethrow;
    }
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    // Handle schema changes between versions
    print('Upgrading database from version $oldVersion to $newVersion');
  }

  Future<void> _downgradeDB(Database db, int oldVersion, int newVersion) async {
    // Handle schema downgrades (if necessary)
    print('Downgrading database from version $oldVersion to $newVersion');
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
