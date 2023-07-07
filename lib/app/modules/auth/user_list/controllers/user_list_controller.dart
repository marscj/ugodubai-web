import 'dart:async';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/data/providers/user_provider.dart';
import 'package:ugodubai/app/modules/auth/user_list/controllers/user_source.dart';

class UserListController extends GetxController {
  final _source = Rx<UserDataSource>(UserDataSource([]));
  get source => this._source.value;
  set source(value) => this._source.value = value;

  final DataGridController dataGridController = DataGridController();
  final DataPagerController dataPagerController = DataPagerController();

  final _total = 0.obs;
  get total => this._total.value;
  set total(value) => this._total.value = value;

  final _rowsPerPage = 20.obs;
  get rowsPerPage => this._rowsPerPage.value;
  set rowsPerPage(value) => this._rowsPerPage.value = value;

  get pageCount => (total / rowsPerPage).ceil();

  @override
  void onReady() {
    super.onReady();

    unawaited(getSource({
      'pageSize': rowsPerPage,
      'pageNum': 1,
    }));
  }

  Future<void> getSource(payload) async {
    return UserProvider().getUsers(payload).then((value) {
      source = UserDataSource(value.data?.userList ?? []);
      total = value.data?.total ?? 0;
    });
  }
}
