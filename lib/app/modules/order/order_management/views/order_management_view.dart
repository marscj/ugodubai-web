import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/routes/app_pages.dart';

class OrderManagementView extends StatelessWidget {
  const OrderManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          delegate: delegate,
          initialRoute: Routes.ORDER_LIST,
          anchorRoute: Routes.ORDER,
          filterPages: (afterAnchor) => afterAnchor.take(1),
        );
      },
    );
  }
}
