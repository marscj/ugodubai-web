import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout_tab.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutTab(
      child: Center(
        child: ElevatedButton(
          child: Text('OrderListView'),
          onPressed: () {},
        ),
      ),
    );
  }
}
