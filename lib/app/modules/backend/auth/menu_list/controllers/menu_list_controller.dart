import 'dart:async';

import 'package:get/get.dart';
import 'package:ugodubai/app/data/providers/menu_provider.dart';
import 'package:ugodubai/app/modules/backend/auth/menu_list/controllers/menu_source.dart';

class MenuListController extends GetxController {
  final _source = Rx<MenuDataSource>(MenuDataSource());

  MenuDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  @override
  void onInit() {
    super.onInit();

    unawaited(getSource());
  }

  Future<void> getSource([Map<String, dynamic>? payload]) async {
    return MenuProvider().getMenus(payload).then((value) {
      source = MenuDataSource(
        data: value.data?.menu ?? [],
      );
    });
  }
}
