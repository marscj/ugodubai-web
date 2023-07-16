import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderListController(),
      builder: (OrderListController controller) {
        return Obx(
          () => Center(
            child: ElevatedButton(
              child: Text('OrderListView ${controller.count}'),
              onPressed: () {
                controller.count.value++;
              },
            ),
          ),
        );
      },
    );
  }
}
