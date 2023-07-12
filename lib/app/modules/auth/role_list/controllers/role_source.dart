import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/role_list_model.dart';

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
      columnName: 'name',
      label:
          'name'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'remark',
      label: 'remark'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'dataScope',
      label: 'scope'.tr.text.white.bold.paddingAll(16).align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 80,
    ),
    GridColumn(
      columnName: 'active',
      label: 'active'.tr.text.white.bold.align(Alignment.center),
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      autoFitPadding: EdgeInsets.all(16),
    ),
  ];

  List<DataGridCell> dataGridCell(Role data) => [
        DataGridCell<String>(columnName: 'id', value: data.id.toString()),
        DataGridCell<String>(columnName: 'name', value: data.name),
        DataGridCell<String>(columnName: 'remark', value: data.remark),
        DataGridCell<int>(columnName: 'dataScope', value: data.dataScope),
        DataGridCell<bool>(columnName: 'active', value: data.status!.toBool),
      ];

  List<Widget> dataGridRowAdapter(List<DataGridCell> cell) {
    return cell.map<Widget>((dataCell) {
      switch (dataCell.columnName) {
        case 'active':
          return Checkbox(value: dataCell.value, onChanged: null)
              .align(Alignment.center)
              .paddingSymmetric(vertical: 6, horizontal: 16);

        case 'id':
        case 'dataScope':
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
