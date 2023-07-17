import 'package:get/get.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserDetailController>(
      UserDetailController(),
    );
  }
}
