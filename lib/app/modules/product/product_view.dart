import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/routes/app_pages.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          delegate: delegate,
          initialRoute: Routes.PRODUCT_LIST,
          anchorRoute: Routes.PRODUCT,
          filterPages: (afterAnchor) => afterAnchor.take(1),
        );
      },
    );
  }
}
