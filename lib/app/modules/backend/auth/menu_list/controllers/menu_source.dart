import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/data/menu_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/pack/syncfusion_flutter_datagrid/datagrid.dart';

class RowDataSource {
  final List<GridColumn> dataGridColumn = [
    GridColumn(
      columnName: 'id',
      label: 'ID'.text.white.bold.align(Alignment.center),
      width: 60,
    ),
    GridColumn(
      columnName: 'pid',
      label: 'PID'.text.white.bold.align(Alignment.center),
      width: 60,
    ),
    GridColumn(
      columnName: 'title',
      label:
          'title'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
    ),
    GridColumn(
      columnName: 'name',
      label:
          'api'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
    ),
    GridColumn(
      columnName: 'path',
      label: 'router'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
    ),
    GridColumn(
      columnName: 'redirect',
      label: 'redirect'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
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
    ),
    GridColumn(
      columnName: 'menu_type',
      label:
          'menu_type'.tr.text.white.bold.paddingAll(16).align(Alignment.center),
      columnWidthMode: ColumnWidthMode.auto,
    ),
  ];

  List<DataGridCell> dataGridCell(Menu data) => [
        DataGridCell<String>(columnName: 'id', value: data.id.toString()),
        DataGridCell<String>(columnName: 'pid', value: data.pid.toString()),
        DataGridCell<String>(columnName: 'title', value: data.title),
        DataGridCell<String>(columnName: 'name', value: data.name),
        DataGridCell<String>(columnName: 'path', value: data.path),
        DataGridCell<String>(columnName: 'redirect', value: data.redirect),
        DataGridCell<String>(columnName: 'remark', value: data.remark),
        DataGridCell<String>(
            columnName: 'menu_type',
            value: 'menu_type_data'.tr.list()[data.menuType!]),
      ];

  List<Widget> dataGridRowAdapter(List<DataGridCell> cell) {
    return cell.map<Widget>((dataCell) {
      switch (dataCell.columnName) {
        case 'active':
          return Checkbox(value: dataCell.value, onChanged: null)
              .align(Alignment.center)
              .paddingSymmetric(vertical: 6, horizontal: 16);

        case 'id':
        case 'pid':
        case 'menu_type':
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

class MenuDataSource<T> extends DataGridSource with RowDataSource {
  MenuDataSource({
    this.rowsPerPage = 20,
    this.total = 0,
    this.future,
    List<Menu> data = const [],
  }) {
    buildDataGridRow(data);
  }

  List<DataGridRow> dataGridRows = <DataGridRow>[];

  final int total;

  final int rowsPerPage;

  final Future<MenuListRes> Function(Map<String, dynamic>)? future;

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
    dataGridRows = data.map<DataGridRow>((Menu data) {
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
