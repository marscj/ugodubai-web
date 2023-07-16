import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_category_controller.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductCategoryController(),
      builder: (ProductCategoryController controller) {
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
      },
    );
  }
}
