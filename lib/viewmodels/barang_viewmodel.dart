import 'package:flutter/foundation.dart';
import 'package:re_pharma/services/sql_service.dart';
import 'package:re_pharma/models/barang_model.dart';

class BarangViewModel extends SQLService with ChangeNotifier {
  static const String table = 'barang';

  String _orderBy = 'nama';
  String get orderBy => _orderBy;

  int _limit = 25;
  int get limit => _limit;

  int _offset = 0;
  int get offset => _offset;

  void searchProperties({String? orderBy, int? limit, int? offset}) {
    if (orderBy != null) {
      _orderBy = orderBy;
    }
    if (limit != null) {
      _limit = limit;
    }
    if (offset != null) {
      _offset = offset;
    }
    notifyListeners();
  }

  Future<int> insertData(BarangModel model) async {
    Map<String, dynamic> data = {
      'plu': model.plu,
      'nama': model.nama,
      'rak': model.rak,
      'golongan': model.golongan,
    };
    return super.create(table: table, data: data);
  }

  Future<List<Map<String, dynamic>>> getData({String? search}) async {
    final bool onSearch = (search != null) ? true : false;

    String query = """
    SELECT * FROM $table
    ORDER BY $orderBy LIMIT $limit OFFSET $offset
    """;

    String querySearch = """
    SELECT * FROM $table
    WHERE plu LIKE '%$search%'
    OR nama LIKE '%$search%'
    OR rak LIKE '%$search%'
    OR golongan LIKE '%$search%'
    ORDER BY $orderBy LIMIT $limit OFFSET $offset
    """;
    return super
        .read(onSearch: onSearch, query: query, querySearch: querySearch);
  }

  Future<int> updateData(int id, BarangModel model) {
    String query = """
    UPDATE $table SET
    plu = ?,
    nama = ?,
    rak = ?,
    golongan = ?
    WHERE id = $id
    """;
    List<Object?> arguments = [
      model.plu,
      model.nama,
      model.rak,
      model.golongan,
    ];
    return super.update(query: query, arguments: arguments);
  }

  Future<int> deleteData(int id) {
    String query = '''
    DELETE FROM $table WHERE id = $id
  ''';
  return super.delete(query: query);
  }
}
