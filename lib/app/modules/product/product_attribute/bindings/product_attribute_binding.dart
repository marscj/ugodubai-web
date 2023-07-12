import 'package:get/get.dart';

import '../controllers/product_attribute_controller.dart';

class ProductAttributeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductAttributeController>(
      ProductAttributeController(),
    );
  }
}
