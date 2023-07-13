import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_tag_controller.dart';

class ProductTagView extends GetView<ProductTagController> {
  const ProductTagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('ProductTagView'),
        onPressed: () {},
      ),
    );
  }
}
