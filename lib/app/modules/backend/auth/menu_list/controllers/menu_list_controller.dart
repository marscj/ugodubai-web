import 'dart:async';

import 'package:get/get.dart';
import 'package:ugodubai/app/data/menu_model.dart';
import 'package:ugodubai/app/data/providers/menu_provider.dart';

class MenuListController extends GetxController {
  final Rx<List<Menu>> _menus = Rx<List<Menu>>([]);
  List<Menu> get menus => this._menus.value;
  set menus(value) => this._menus.value = value;

  @override
  void onInit() {
    super.onInit();

    unawaited(getSource({'pageSize': 100, 'pageNum': 1}));
  }

  Future<void> getSource(Map<String, dynamic> payload) async {
    return MenuProvider().getMenus(payload).then((value) {
      menus = value.data?.rules ?? [];
    });
  }
}
