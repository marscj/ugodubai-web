import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';

import '../controllers/product_attribute_controller.dart';

class ProductAttributeView extends GetView<ProductAttributeController> {
  const ProductAttributeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: ElevatedButton(
          child: Text('ProductAttributeView'),
          onPressed: () {},
        ),
      ),
    );
  }
}
