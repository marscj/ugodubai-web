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
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () => () {},
              splashColor: Colors.blueGrey,
              child: Text(
                'ProductCategoryView ${controller.count.value}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
