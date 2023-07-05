import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/providers/user_provider.dart';
import 'package:ugodubai/app/data/user_model.dart';

class UserDataSource extends DataGridSource {
  /// Instance of an employee.
  List<UserList> source = <UserList>[];

  /// Instance of DataGridRow.
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  Future<void> generateList() async {
    await asyncData().then((value) {
      source = value;
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
      return DataGridRow(cells: <DataGridCell<dynamic>>[
        DataGridCell<String>(columnName: 'id', value: user.id.toString()),
        DataGridCell<String>(columnName: 'username', value: user.userName),
        DataGridCell<String>(columnName: 'email', value: user.userEmail),
        DataGridCell<dynamic>(columnName: 'active', value: user.userStatus),
      ]);
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
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Text(dataCell.value.toString()),
      );
    }).toList());
  }
}
