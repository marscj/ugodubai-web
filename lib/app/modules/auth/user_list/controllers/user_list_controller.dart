import 'dart:async';

import 'package:get/get.dart';
import 'package:ugodubai/app/modules/auth/user_list/controllers/user_source.dart';

class UserListController extends GetxController {
  final _source = Rx<UserDataSource>(UserDataSource());
  UserDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  final _idColumnWidth = 80.0.obs;
  get idColumnWidth => this._idColumnWidth.value;
  set idColumnWidth(value) => this._idColumnWidth.value = value;

  @override
  void onReady() {
    super.onReady();

    unawaited(getSource());
  }

  Future<void> getSource() async {
    return source.generateList();
  }
}
