import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  SQLiteDatabase._privateConstructor();

  static final SQLiteDatabase instance = SQLiteDatabase._privateConstructor();

  final String _databaseName = 'App.db';
  final int _currentDBVersion = 1;
  Database? _database;

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _currentDBVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    /// Create new table query HERE
    // await db.execute(NotificationTable.queryCreateTable);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    var batch = db.batch();
    var version = oldVersion;

    /// Implement table changes HERE
    /// if (version == 101) {...} is meaning for code log table database changes,
    /// DON'T REMOVE OLDER CODE, because this will make app cannot update table database
    ///
    /// Create new table or, drop table and update existing table
    /// example code:
    ///   batch.execute('ALTER TABLE notification_table ADD isUnread BOOLEAN NOT NULL');
    if (version == 101) {
      // Changes before not written in code
      // Log: add column [category, imageUrl, expImageUrl] in table notification
      version++;
    }
    if (version == 102) {
      // Changes before not written in code
      // Log: add column [actionType, actionUID] in table notification
      version++;
    }
    if (version == 103) {
      // Changes before not written in code
      // Log: add column [userId, date, isUnread] in table notification
      version++;
    }
    await batch.commit();
  }
}
