import 'package:flutter/material.dart';

class DataTableCustom extends StatelessWidget {
  const DataTableCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const <DataColumn>[
      DataColumn(label: Expanded(child: Text('')))
    ], rows: const <DataRow>[]);
  }
}