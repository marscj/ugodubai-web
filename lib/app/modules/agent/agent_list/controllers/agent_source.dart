import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/pack/syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/agent_list_model.dart';
import 'package:ugodubai/app/data/agent_model.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class RowDataSource {
  final List<GridColumn> dataGridColumn = [
    GridColumn(
      columnName: 'id',
      label: 'ID'.text.white.bold.align(Alignment.center),
      autoFitPadding: EdgeInsets.all(16),
      width: 60,
    ),
    GridColumn(
      columnName: 'name',
      label: 'agent_name'
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
      columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      columnName: 'agentCode',
      label: 'agent_code'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'availableLimit',
      label: 'available_limit'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'creditLimit',
      label: 'credit_limit'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'outstandingBalance',
      label: 'outstanding_balance'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
    GridColumn(
      columnName: 'accountBlance',
      label: 'account_blance'
          .tr
          .text
          .white
          .bold
          .paddingAll(16)
          .align(Alignment.centerLeft),
      autoFitPadding: EdgeInsets.all(16),
    ),
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

  List<DataGridCell> dataGridCell(Agent user) => [
        DataGridCell<String>(columnName: 'id', value: user.id.toString()),
        DataGridCell<String>(columnName: 'name', value: user.name),
        DataGridCell<String>(columnName: 'email', value: user.email),
        DataGridCell<String>(columnName: 'agentCode', value: user.agentCode),
        DataGridCell<double>(
            columnName: 'availableLimit', value: user.availableLimit),
        DataGridCell<double>(
            columnName: 'creditLimit', value: user.creditLimit),
        DataGridCell<double>(
            columnName: 'outstandingBalance', value: user.outstandingBalance),
        DataGridCell<double>(
            columnName: 'accountBlance', value: user.accountBlance),
        DataGridCell<bool>(columnName: 'active', value: user.status!.toBool),
        DataGridCell(columnName: 'action', value: null),
      ];

  List<Widget> dataGridRowAdapter(List<DataGridCell> cell) {
    return cell.map<Widget>((dataCell) {
      switch (dataCell.columnName) {
        // case 'availableLimit':
        // case 'creditLimit':
        // case 'outstandingBalance':
        // case 'accountBlance':
        //   return dataCell.value
        //       .toString()
        //       .text
        //       .paddingSymmetric(vertical: 6, horizontal: 16)
        //       .align(Alignment.center);
        case 'active':
          return Checkbox(value: dataCell.value, onChanged: null)
              .align(Alignment.center)
              .paddingSymmetric(vertical: 6, horizontal: 16);
        case 'action':
          return ButtonBar(
            children: [TextButton(onPressed: () {}, child: 'recharge'.tr.text)],
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

class AgentDataSource<T> extends DataGridSource with RowDataSource {
  AgentDataSource({
    this.rowsPerPage = 20,
    this.total = 0,
    this.future,
    List<Agent> data = const [],
  }) {
    buildDataGridRow(data);
  }

  List<DataGridRow> dataGridRows = <DataGridRow>[];

  final int total;

  final int rowsPerPage;

  final Future<AgentListRes> Function(Map<String, dynamic>)? future;

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
