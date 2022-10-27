import 'package:path/path.dart';
import 'package:sleep_optimizer/models/sleep_record_model.dart';
import 'package:sqflite/sqflite.dart';

class SleepRecordRepository {
  static final SleepRecordRepository instance = SleepRecordRepository._initialize();
  static Database? _db;
  static const dbFileName = 'sleep_record.db';

  SleepRecordRepository._initialize();

  Future _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE [IF NOT EXISTS] ${SleepRecordFields.tableSleepRecord} (
        ${SleepRecordFields.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${SleepRecordFields.columnStart} INTEGER,
        ${SleepRecordFields.columnEnd} INTEGER,
        ${SleepRecordFields.columnFeel} TEXT
      );
      ''');
  }

  Future<Database> _initDb(String dbFileName) async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, dbFileName);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<Database?> getDb() async {
    return _db ??= await _initDb(dbFileName);
  }

  Future close() async {
    final db = await instance.getDb();
    db!.close();
  }

  Future<int> addSleepRecord(SleepRecord sleepRecord) async {
    final db = await instance.getDb();
    return db!.insert(SleepRecordFields.tableSleepRecord, sleepRecord.toMap());
  }

  Future<SleepRecord> getSleepRecord(int id) async {
    final db = await instance.getDb();
    final List<Map<String, Object?>> result = await db!.query(
      SleepRecordFields.tableSleepRecord,
      columns: [
        SleepRecordFields.columnId,
        SleepRecordFields.columnStart,
        SleepRecordFields.columnEnd,
        SleepRecordFields.columnFeel,
      ],
      where: '${SleepRecordFields.columnId} = ?',
      whereArgs: [id],
    );

    if (result.length == 1) {
      return SleepRecord.fromMap(result.first);
    } else {
      throw Exception('Record $id not found.');
    }
  }

  Future<List<SleepRecord>> getAllSleepRecord() async {
    final db = await instance.getDb();
    final List<Map<String, Object?>> result = await db!.query(
      SleepRecordFields.tableSleepRecord,
      orderBy: '${SleepRecordFields.columnId} DES',
    );
    return result.map((e) => SleepRecord.fromMap(e)).toList();
  }
}