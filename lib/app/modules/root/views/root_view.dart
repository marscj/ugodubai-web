import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/routes/app_pages.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          initialRoute: Routes.HOME,
          anchorRoute: '/',
          filterPages: (afterAnchor) => afterAnchor.take(1),
        );
      },
    );
  }
}
