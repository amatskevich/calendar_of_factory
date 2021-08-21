import 'package:calendaroffactory/persistent/custom_shift_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  final tableCustomShiftData = "CUSTOM_SHIFT_DATA";
  Future<Database>? database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal() {
    initDatabase();
  }

  initDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'calendar_of_factory.db'),
      // When the database is first created, create a table to store data.
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE $tableCustomShiftData(
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT,
            show INTEGER)
          ''',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> _insertShiftData(CustomShiftData data) async {
    final db = await database;
    if (db == null) {
      return;
    }
    await db.insert(tableCustomShiftData, data.toMap());
  }

  Future<void> _updateShiftData(CustomShiftData data) async {
    final db = await database;
    if (db == null) {
      return;
    }
    await db.update(
      tableCustomShiftData,
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  Future<void> upsertShiftData(CustomShiftData data) async {
    CustomShiftData? shiftData = await getShiftData(data.id);
    if (shiftData == null) {
      _insertShiftData(data);
    } else {
      _updateShiftData(data);
    }
  }

  Future<CustomShiftData?> getShiftData(int id) async {
    final db = await database;
    if (db == null) {
      return null;
    }
    List<Map<String, dynamic>> result = await db.query(tableCustomShiftData, where: 'id = ?', whereArgs: [id]);
    if (result.length > 0) {
      return CustomShiftData.fromMap(result.first);
    }
    return null;
  }

  Future<List<CustomShiftData>> getAllShiftDatas() async {
    final db = await database;
    if (db == null) {
      return [];
    }
    final List<Map<String, dynamic>> maps = await db.query(tableCustomShiftData);
    return List.generate(maps.length, (i) {
      return CustomShiftData.fromMap(maps[i]);
    });
  }
}
