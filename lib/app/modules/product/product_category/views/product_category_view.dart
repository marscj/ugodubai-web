import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

import '../controllers/product_category_controller.dart';

class ProductCategoryView extends GetView<ProductCategoryController> {
  const ProductCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: ElevatedButton(
          child: Text('ProductCategoryView'),
          onPressed: () {},
        ),
      ),
    );
  }
}
