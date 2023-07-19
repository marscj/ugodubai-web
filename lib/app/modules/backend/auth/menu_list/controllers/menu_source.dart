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
        label: 'ID'.tr.text.white.bold.align(Alignment.center),
        width: 60,
        columnWidthMode: ColumnWidthMode.fill),
    // GridColumn(
    //   columnName: 'title',
    //   label:
    //       'name'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
    // ),
    // // GridColumn(
    // //   columnName: 'name',
    // //   label:
    // //       'name'.tr.text.white.bold.paddingAll(16).align(Alignment.centerLeft),
    // // ),
    // GridColumn(
    //   columnName: 'remark',
    //   label: 'remark'
    //       .tr
    //       .text
    //       .white
    //       .bold
    //       .paddingAll(16)
    //       .align(Alignment.centerLeft),
    // ),
  ];

  List<DataGridCell> dataGridCell(Menu data) => [
        DataGridCell<String>(columnName: 'id', value: data.id.toString()),
        // DataGridCell<String>(columnName: 'title', value: data.name),
        // DataGridCell<String>(columnName: 'remark', value: data.remark),
      ];

  List<Widget> dataGridRowAdapter(List<DataGridCell> cell) {
    // return cell.map<Widget>((dataCell) {
    //   switch (dataCell.columnName) {
    //     case 'active':
    //       return Checkbox(value: dataCell.value, onChanged: null)
    //           .align(Alignment.center)
    //           .paddingSymmetric(vertical: 6, horizontal: 16);

    //     case 'id':
    //     case 'dataScope':
    //       return dataCell.value
    //           .toString()
    //           .text
    //           .paddingSymmetric(vertical: 6, horizontal: 16)
    //           .align(Alignment.center);
    //     default:
    //       return dataCell.value
    //           .toString()
    //           .text
    //           .paddingSymmetric(vertical: 6, horizontal: 16)
    //           .align(Alignment.centerLeft);
    //   }
    // }).toList();
    return cell
        .map<Widget>((e) => ExpansionTile(
              title: Text('widget.title'),
              onExpansionChanged: (isExpanded) {},
              children: [
                ListTile(
                  title: Text('Subitem 1'),
                ),
                ListTile(
                  title: Text('Subitem 2'),
                ),
              ],
            ))
        .toList();
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
