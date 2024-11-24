import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../app/models/reminder.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'reminders.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE reminders(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            details TEXT,
            time TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<int> insertReminder(Reminder reminder) async {
    final db = await database;
    return await db.insert('reminders', reminder.toMap());
  }

  Future<List<Reminder>> getReminders() async {
    final db = await database;
    final reminders = await db.query('reminders');
    return reminders.map((e) => Reminder.fromMap(e)).toList();
  }

  // Add delete reminder method
  Future<int> deleteReminder(int id) async {
    final db = await database;
    return await db.delete(
      'reminders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Add method to delete all reminders
  Future<int> deleteAllReminders() async {
    final db = await database;
    return await db.delete('reminders');
  }
}