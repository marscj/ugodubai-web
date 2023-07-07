import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:ugodubai/app/data/user_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class RowDataSource {
  final List<GridColumn> dataGridColumn = [
    GridColumn(
      columnName: 'id',
      label: 'ID'.tr.text.white.bold.align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 60,
    ),
    GridColumn(
      columnName: 'username',
      label: 'UserName'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'email',
      label: 'email_address'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'role',
      label:
          'Role'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'active',
      label: 'Active'.tr.text.white.bold.align(Alignment.center),
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'action',
      label: 'Actions'.tr.text.white.bold.align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 100,
    ),
  ];

  List<DataGridCell> dataGridCell(User user) => [
        DataGridCell<String>(columnName: 'id', value: user.id.toString()),
        DataGridCell<String>(columnName: 'username', value: user.userName),
        DataGridCell<String>(columnName: 'email', value: user.userEmail),
        DataGridCell<List<RoleInfo>?>(columnName: 'role', value: user.roleInfo),
        DataGridCell<bool>(
            columnName: 'active', value: user.userStatus!.toBool),
        DataGridCell(columnName: 'action', value: null),
      ];

  List<Widget> dataGridRowAdapter(List<DataGridCell> cell) {
    return cell.map<Widget>((dataCell) {
      switch (dataCell.columnName) {
        case 'role':
          return dataCell.value != null
              ? dataCell.value
                  .map((data) => data.name)
                  .toList()
                  .join(',')
                  .toString()
                  .text
                  .paddingSymmetric(vertical: 6, horizontal: 16)
                  .align(Alignment.centerLeft)
              : SizedBox.shrink();
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
    }).toList();
  }
}

class UserDataSource<T> extends DataGridSource with RowDataSource {
  UserDataSource({
    this.rowsPerPage = 20,
    this.total = 0,
    this.future,
    List<User> data = const [],
  }) {
    buildDataGridRow(data);
  }

  List<DataGridRow> dataGridRows = <DataGridRow>[];

  final int total;

  final int rowsPerPage;

  final Future<UserListRes> Function(Map<String, dynamic>)? future;

  get pageCount => (total / rowsPerPage).ceil();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
    if (oldPageIndex != newPageIndex) {
      return future != null
          ? future!({
              'pageSize': rowsPerPage,
              'pageNum': newPageIndex + 1,
            }).then((value) {
              return super.handlePageChange(oldPageIndex, newPageIndex);
            })
          : super.handlePageChange(oldPageIndex, newPageIndex);
    }

    return super.handlePageChange(oldPageIndex, newPageIndex);
  }

  void buildDataGridRow(data) {
    dataGridRows = data.map<DataGridRow>((User user) {
      return DataGridRow(
        cells: dataGridCell(user),
      );
    }).toList();
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: dataGridRowAdapter(row.getCells()));
  }
}
