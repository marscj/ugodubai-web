import 'package:get/get.dart';

import '../controllers/role_list_controller.dart';

class RoleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RoleListController>(
      RoleListController(),
    );
  }
}
