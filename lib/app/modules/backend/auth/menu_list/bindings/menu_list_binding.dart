import 'package:get/get.dart';

import '../controllers/menu_item_controller.dart';
import '../controllers/menu_list_controller.dart';

class MenuListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuListController>(
      () => MenuListController(),
    );
    Get.create(() => MenuItemController());
  }
}
