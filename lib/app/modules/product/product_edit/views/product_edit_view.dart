import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

import '../controllers/product_edit_controller.dart';

class ProductEditView extends GetView<ProductEditController> {
  const ProductEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: ElevatedButton(
          child: Text('ProductEditView'),
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.CONSOLE);
          },
        ),
      ),
    );
  }
}
