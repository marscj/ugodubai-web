import 'dart:async';

import 'package:get/get.dart';

import 'package:ugodubai/app/data/providers/user_provider.dart';
import 'package:ugodubai/app/data/user_list_model.dart';
import 'package:ugodubai/app/modules/auth/user_list/controllers/user_source.dart';

class UserListController extends GetxController {
  final _source = Rx<UserDataSource>(UserDataSource());

  UserDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  @override
  void onReady() {
    super.onReady();

    unawaited(getSource({'pageSize': 20, 'pageNum': 1}));
  }

  Future<UserListRes> getSource(Map<String, dynamic> payload) async {
    return UserProvider().getUsers(payload).then((value) {
      source = UserDataSource(
        data: value.data?.user ?? [],
        rowsPerPage: payload['pageSize'],
        total: value.data!.total!,
        future: getSource,
      );
      return value;
    });
  }
}
