import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:ugodubai/app/data/user_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class UserDataSource<T> extends DataGridSource {
  UserDataSource({
    this.rowsPerPage = 20,
    this.total = 0,
    this.future,
    List<UserList>? data,
  }) {
    buildDataGridRow(data ?? []);
  }

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
