import 'package:re_pharma/databases/sql_database.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class SQLService {
  Future<int> create(
      {required String table, required Map<String, dynamic> data}) async {
    final db = await SQLDatabase.db();
    final id = await db.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  Future<List<Map<String, dynamic>>> read(
      {required bool onSearch,
      required String query,
      required String querySearch}) async {
    final db = await SQLDatabase.db();
    final res = db.rawQuery(onSearch ? querySearch : query);
    db.close();
    return res;
  }

  Future<int> update(
      {required String query,
      required List<Object?> arguments}) async {
    final db = await SQLDatabase.db();
    final res = db.rawUpdate(query, arguments);
    db.close();
    return res;
  }

  Future<int> delete({required String query}) async {
    final db = await SQLDatabase.db();
    final res = db.rawDelete(query);
    db.close();
    return res;
  }
}
