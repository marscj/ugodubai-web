import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:ugodubai/app/data/user_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/modules/auth/user_list/controllers/user_list_controller.dart';

class UserDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  List<GridColumn> dataGridColumn = [
    GridColumn(
      columnName: 'id',
      label: 'ID'.tr.text.grey.bold.paddingAll(16).align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 60,
    ),
    GridColumn(
      columnName: 'username',
      label: 'UserName'
          .tr
          .text
          .grey
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'email',
      label:
          'Email'.tr.text.grey.bold.paddingAll(16).align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'active',
      label: 'Active'.tr.text.grey.bold.paddingAll(12).align(Alignment.center),
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'action',
      label: 'Actions'.tr.text.grey.bold.paddingAll(16).align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 100,
    ),
  ];

  UserDataSource(List<UserList> list) {
    buildDataGridRow(list);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
    UserListController controller = Get.find();

    if (oldPageIndex != newPageIndex) {
      return controller.getSource({
        'pageSize': controller.rowsPerPage,
        'pageNum': newPageIndex + 1,
      }).then((value) {
        return super.handlePageChange(oldPageIndex, newPageIndex);
      });
    }

    return super.handlePageChange(oldPageIndex, newPageIndex);
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

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((DataGridCell dataCell) {
      switch (dataCell.columnName) {
        case 'active':
          return Checkbox(value: dataCell.value, onChanged: null)
              .align(Alignment.center)
              .paddingSymmetric(vertical: 6, horizontal: 16);
        case 'action':
          return ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: 'reset_password'.tr.text)
            ],
          );
        case 'id':
          return dataCell.value
              .toString()
              .text
              .paddingSymmetric(vertical: 6, horizontal: 16)
              .align(Alignment.center);
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

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// import 'package:ugodubai/app/data/providers/user_provider.dart';
// import 'package:ugodubai/app/data/user_model.dart';
// import 'package:ugodubai/app/extensions/base.dart';
// import 'package:ugodubai/app/extensions/widget.dart';
// import 'package:ugodubai/app/modules/auth/user_list/controllers/user_list_controller.dart';

// class UserDataSource extends DataGridSource {
//   List<DataGridRow> dataGridRows = <DataGridRow>[];

//   UserDataSource(List<UserList> list) {

//   }

//   @override
//   List<DataGridRow> get rows => dataGridRows;

//   Future<UserListData?> asyncList([payload]) async {
//     return UserProvider()
//         .getUsers(payload ??
//             {
//               'pageSize': 10,
//               'pageNum': 1,
//             })
//         .then((value) {
//       buildDataGridRow(value.data?.userList ?? []);
//       return value.data;
//     });
//   }

//   @override
//   Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
//     UserListController controller = Get.find();

//     if (oldPageIndex != newPageIndex) {
//       return asyncList({
//         'pageSize': controller.rowsPerPage,
//         'pageNum': newPageIndex + 1,
//       }).then((value) {
//         return super.handlePageChange(oldPageIndex, newPageIndex);
//       });
//     }

//     return super.handlePageChange(oldPageIndex, newPageIndex);
//   }

//   /// Building DataGridRows
//   void buildDataGridRow(data) {
//     dataGridRows = data.map<DataGridRow>((UserList user) {
//       return DataGridRow(
//         cells: <DataGridCell>[
//           DataGridCell<String>(columnName: 'id', value: user.id.toString()),
//           DataGridCell<String>(columnName: 'username', value: user.userName),
//           DataGridCell<String>(columnName: 'email', value: user.userEmail),
//           DataGridCell<bool>(
//               columnName: 'active', value: user.userStatus!.toBool),
//           DataGridCell(columnName: 'action', value: null),
//         ],
//       );
//     }).toList();
//     notifyListeners();
//   }

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((DataGridCell dataCell) {
//       switch (dataCell.columnName) {
//         case 'active':
//           return Checkbox(value: dataCell.value, onChanged: null)
//               .align(Alignment.center)
//               .paddingSymmetric(vertical: 6, horizontal: 16);
//         case 'action':
//           return ButtonBar(
//             children: [
//               TextButton(onPressed: () {}, child: 'reset_password'.tr.text)
//             ],
//           );
//         default:
//           return dataCell.value
//               .toString()
//               .text
//               .paddingSymmetric(vertical: 6, horizontal: 16)
//               .align(Alignment.centerLeft);
//       }
//     }).toList());
//   }
// }
