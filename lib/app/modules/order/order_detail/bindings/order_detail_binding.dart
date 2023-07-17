import 'package:get/get.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderDetailController>(
      OrderDetailController(),
    );
  }
}
