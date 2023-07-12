import 'dart:async';

import 'package:get/get.dart';
import 'package:ugodubai/app/data/providers/role_provider.dart';
import 'package:ugodubai/app/data/role_list_model.dart';
import 'package:ugodubai/app/modules/auth/role_list/controllers/role_source.dart';

class RoleListController extends GetxController {
  final _source = Rx<RoleDataSource>(RoleDataSource());

  RoleDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  @override
  void onReady() {
    super.onReady();

    unawaited(getSource({'pageSize': 100, 'pageNum': 1}));
  }

  Future<RoleListRes> getSource(Map<String, dynamic> payload) async {
    return RoleProvider().getRoles(payload).then((value) {
      source = RoleDataSource(
        data: value.data?.role ?? [],
        rowsPerPage: payload['pageSize'],
        total: value.data!.total!,
        future: getSource,
      );
      return value;
    });
  }
}
