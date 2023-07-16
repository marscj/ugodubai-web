import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_attribute_controller.dart';

class ProductAttributeView extends StatelessWidget {
  const ProductAttributeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductAttributeController(),
      builder: (ProductAttributeController controller) {
        return Obx(
          () => Center(
            child: ElevatedButton(
              child: Text('ProductAttributeView ${controller.count}'),
              onPressed: () {
                controller.count.value++;
              },
            ),
          ),
        );
      },
    );
  }
}
