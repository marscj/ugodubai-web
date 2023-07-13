import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('OrderListView'),
        onPressed: () {},
      ),
    );
  }
}
