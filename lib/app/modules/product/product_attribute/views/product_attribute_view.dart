import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_attribute_controller.dart';

class ProductAttributeView extends GetView<ProductAttributeController> {
  const ProductAttributeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('ProductAttributeView'),
        onPressed: () {},
      ),
    );
  }
}
