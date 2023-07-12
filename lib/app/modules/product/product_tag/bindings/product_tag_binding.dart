import 'package:get/get.dart';

import '../controllers/product_tag_controller.dart';

class ProductTagBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductTagController>(
      ProductTagController(),
    );
  }
}
