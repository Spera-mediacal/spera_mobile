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
      join(dbPath, 'spera_database.db'),
      onCreate: (db, version) async {
        // Create reminders table
        await db.execute('''
        CREATE TABLE reminders(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          details TEXT,
          time TEXT
        )
      ''');

        // Create user_setup table
        await db.execute('''
CREATE TABLE user_setup(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  full_name TEXT,
  phone_number TEXT,
  user_id TEXT,
  blood_type TEXT,
  is_positive INTEGER,
  weight INTEGER,
  height INTEGER,
  age INTEGER
)
''');
      },
      version: 1,
    );
  }

  // Reminder Methods
  Future<int> insertReminder(Reminder reminder) async {
    final db = await database;
    return await db.insert('reminders', reminder.toMap());
  }

  Future<List<Reminder>> getReminders() async {
    final db = await database;
    final reminders = await db.query('reminders');
    return reminders.map((e) => Reminder.fromMap(e)).toList();
  }

  Future<int> deleteReminder(int id) async {
    final db = await database;
    return await db.delete(
      'reminders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllReminders() async {
    final db = await database;
    return await db.delete('reminders');
  }

  // User Setup Methods
  Future<int> saveUserSetup({
    required String fullName,
    required String phoneNumber,
    required String userId,
    required String bloodType,
    required bool isPositive,
    required int weight,
    required int height,
    required int age,
  }) async {
    final db = await database;
    return await db.insert('user_setup', {
      'full_name': fullName,
      'phone_number': phoneNumber,
      'user_id': userId,
      'blood_type': bloodType,
      'is_positive': isPositive ? 1 : 0,
      'weight': weight,
      'height': height,
      'age': age,
    });
  }


  Future<Map<String, dynamic>?> getUserSetup() async {
    final db = await database;
    final results = await db.query('user_setup', limit: 1);
    return results.isNotEmpty ? results.first : null;
  }
}
