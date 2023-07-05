import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/providers/user_provider.dart';
import 'package:ugodubai/app/data/user_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class UserDataSource extends DataGridSource {
  /// Instance of an employee.
  List<UserList> data = <UserList>[];

  /// Instance of DataGridRow.
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  Future<void> generateList() async {
    await asyncData().then((value) {
      data = value;
      buildDataGridRow(value);
    });
  }

  // Populate Data from the json file
  Future<List<UserList>> asyncData() async {
    return UserProvider().getUsers().then((value) {
      return value.data?.userList ?? [];
    });
  }

  /// Building DataGridRows
  void buildDataGridRow(data) {
    dataGridRows = data.map<DataGridRow>((UserList user) {
      return DataGridRow(
        cells: <DataGridCell>[
          DataGridCell<String>(columnName: 'id', value: user.id.toString()),
          DataGridCell<String>(columnName: 'username', value: user.userName),
          DataGridCell<String>(columnName: 'email', value: user.userEmail),
          DataGridCell<bool>(
              columnName: 'active', value: user.userStatus!.toBool),
          DataGridCell(columnName: 'action', value: null),
        ],
      );
    }).toList();
    notifyListeners();
  }

  // Overrides
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((DataGridCell dataCell) {
      switch (dataCell.columnName) {
        case 'active':
          return Checkbox(value: dataCell.value, onChanged: null)
              .align(Alignment.centerLeft)
              .paddingSymmetric(vertical: 6, horizontal: 16)
              .align(Alignment.centerLeft);
        case 'action':
          return ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: 'reset_password'.tr.text)
            ],
          );
        default:
          return dataCell.value
              .toString()
              .text
              .paddingSymmetric(vertical: 6, horizontal: 16)
              .align(Alignment.centerLeft);
      }
    }).toList());
  }
}
