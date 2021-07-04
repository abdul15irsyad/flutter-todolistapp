import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolistapp/models/task.dart';

class DatabaseHelper {
  static const DB_NAME = 'todolistapp.db';
  static const DB_VERSION = 1;

  static const TABLE_TASKS = 'tasks';
  static const COLUMN_ID = 'id';
  static const COLUMN_TEXT = 'text';
  static const COLUMN_STATUS = 'status';

  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initialDatabase();
    return _database;
  }

  _initialDatabase() async {
    String dbPath = await getDatabasesPath();
    await openDatabase(join(dbPath, DB_NAME), version: DB_VERSION,
        onCreate: (Database db, int version) async {
      print('create $TABLE_TASKS table');
      return await db.execute('''
        CREATE TABLE $TABLE_TASKS (
        $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREAMENT,
        $COLUMN_TEXT TEXT NOT NULL,
        $COLUMN_STATUS INTEGER)
        ''');
    });
  }

  // create
  Future<Task> create(Task task) async {
    // final db = await instance.database;
    // final id = await db?.insert(TABLE_TASKS, task.toMap());
    return task;
  }
}
