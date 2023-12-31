import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_category_controller.dart';

class ProductCategoryView extends GetView<ProductCategoryController> {
  const ProductCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: ElevatedButton(
          child: Text('ProductCategoryView ${controller.count}'),
          onPressed: () {
            controller.count.value++;
          },
        ),
      ),
    );
  }
}
