import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/data/list_model.dart';
import 'package:ugodubai/app/data/providers/user_provider.dart';
import 'package:ugodubai/app/data/user_model.dart';

class UserListController extends GetxController {
  final _source = Rx<UserListDataSource>(UserListDataSource([]));
  UserListDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  final _sortColumnIndex = null.obs;
  get sortColumnIndex => this._sortColumnIndex.value;
  set sortColumnIndex(value) => this._sortColumnIndex.value = value;

  final _sortAscending = true.obs;
  get sortAscending => this._sortAscending.value;
  set sortAscending(value) => this._sortAscending.value = value;

  final _rowsPerPage = 10.obs;
  get rowsPerPage => this._rowsPerPage.value;
  set rowsPerPage(value) => this._rowsPerPage.value = value;

  @override
  void onReady() {
    super.onReady();

    unawaited(getList());
  }

  Future<void> getList() async {
    return UserProvider().getUsers().then((value) {
      final list = value.data?.userList ?? [];
      source = UserListDataSource(list);
    });
  }

  void sort<T>(
    Comparable<T> Function(UserList d) getField,
    int columnIndex,
    bool ascending,
  ) {
    source.sort<T>(getField, ascending);
    sortColumnIndex = columnIndex;
    sortAscending = ascending;
  }
}

class UserListDataSource extends DataTableSource {
  UserListDataSource(this.list);

  final List<UserList> list;

  void sort<T>(Comparable<T> Function(UserList d) getField, bool ascending) {
    list.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  void updateSelected(RestorableListSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < list.length; i += 1) {
      var data = list[i];
      if (selectedRows.isSelected(i)) {
        data.selected = true;
        _selectedCount += 1;
      } else {
        data.selected = false;
      }
    }
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    // final format = NumberFormat.decimalPercentPattern(
    //   locale: Get.locale.toString(),
    //   decimalDigits: 0,
    // );
    assert(index >= 0);
    if (index >= list.length) return null;
    final data = list[index];
    return DataRow.byIndex(
      index: index,
      selected: data.selected,
      onSelectChanged: (value) {
        if (data.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          data.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text('${data.id}')),
      ],
    );
  }

  @override
  int get rowCount => list.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final data in list) {
      data.selected = checked ?? false;
    }
    _selectedCount = checked! ? list.length : 0;
    notifyListeners();
  }
}
