import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/pack/syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/order_list_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class RowDataSource {
  final List<GridColumn> dataGridColumn = [
    GridColumn(
      columnName: 'id',
      label: 'ID'.text.white.bold.align(Alignment.center),
      width: 60,
    ),
    GridColumn(
      columnName: 'action',
      label: 'actions'.tr.text.white.bold.align(Alignment.center),
      width: 100,
    ),
  ];

  List<DataGridCell> dataGridCell(Order data) => [
        DataGridCell<String>(columnName: 'id', value: data.id.toString()),
        DataGridCell(columnName: 'action', value: null),
      ];

  List<Widget> dataGridRowAdapter(List<DataGridCell> cell) {
    return cell.map<Widget>((dataCell) {
      switch (dataCell.columnName) {
        case 'action':
          return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [TextButton(onPressed: () {}, child: 'recharge'.tr.text)],
          );
        case 'id':
          return dataCell.value
              .toString()
              .url('${Routes.AGENT_DETAIL}/1234')
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

class OrderDataSource<T> extends DataGridSource with RowDataSource {
  OrderDataSource({
    this.rowsPerPage = 20,
    this.total = 0,
    this.future,
    List<Order> data = const [],
  }) {
    buildDataGridRow(data);
  }

  List<DataGridRow> dataGridRows = <DataGridRow>[];

  final int total;

  final int rowsPerPage;

  final Future<OrderListRes> Function(Map<String, dynamic>)? future;

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
    dataGridRows = data.map<DataGridRow>((value) {
      return DataGridRow(
        cells: dataGridCell(value),
      );
    }).toList();
    notifyListeners();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: dataGridRowAdapter(row.getCells()));
  }
}
