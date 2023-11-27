import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLDatabase {
  static const String dirName = 'repharma';
  static const String dbName = 'dbv1.db';

  static Future<void> createTables(Database database) async {
    await database.execute("""
      CREATE TABLE barang(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        plu TEXT,
        nama TEXT,
        rak TEXT,
        golongan TEXT
      )
""");
  }

  static Future<Database> db() async {
    var databaseFactory = databaseFactoryFfi;
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDocumentsDir.path, dirName, dbName);
    var db = await databaseFactory.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async => await createTables(db),
      ),
    );
    return db;
  }
}
