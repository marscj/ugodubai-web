import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/role_list_model.dart';
import 'package:ugodubai/app/data/user_list_model.dart';

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
    // GridColumn(
    //   columnName: 'username',
    //   label: 'username'
    //       .tr
    //       .text
    //       .white
    //       .bold
    //       .paddingAll(16)
    //       .align(Alignment.centerLeft),
    //   autoFitPadding: EdgeInsets.all(16),
    // ),
    // GridColumn(
    //   columnName: 'email',
    //   label: 'email_address'
    //       .tr
    //       .text
    //       .white
    //       .bold
    //       .paddingAll(16)
    //       .align(Alignment.centerLeft),
    //   autoFitPadding: EdgeInsets.all(16),
    // ),
    // GridColumn(
    //   columnName: 'role',
    //   label:
    //       'role'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
    //   autoFitPadding: EdgeInsets.all(16),
    // ),
    GridColumn(
      columnName: 'active',
      label: 'active'.tr.text.white.bold.align(Alignment.center),
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'action',
      label: 'actions'.tr.text.white.bold.align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 100,
    ),
  ];

  List<DataGridCell> dataGridCell(Role data) => [
        DataGridCell<String>(columnName: 'id', value: data.id.toString()),
        // DataGridCell<String>(columnName: 'username', value: data.userName),
        // DataGridCell<String>(columnName: 'email', value: user.userEmail),
        // DataGridCell<List<RoleInfo>?>(columnName: 'role', value: user.roleInfo),
        DataGridCell<bool>(columnName: 'active', value: data.status!.toBool),
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
                  .join(' | ')
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

class RoleDataSource<T> extends DataGridSource with RowDataSource {
  RoleDataSource({
    this.rowsPerPage = 20,
    this.total = 0,
    this.future,
    List<Role> data = const [],
  }) {
    buildDataGridRow(data);
  }

  List<DataGridRow> dataGridRows = <DataGridRow>[];

  final int total;

  final int rowsPerPage;

  final Future<RoleListRes> Function(Map<String, dynamic>)? future;

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
    dataGridRows = data.map<DataGridRow>((Role data) {
      return DataGridRow(
        cells: dataGridCell(data),
      );
    }).toList();
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: dataGridRowAdapter(row.getCells()));
  }
}
