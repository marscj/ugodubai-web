import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: ElevatedButton(
          child: Text('OrderDetailView'),
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.CONSOLE);
          },
        ),
      ),
    );
  }
}
