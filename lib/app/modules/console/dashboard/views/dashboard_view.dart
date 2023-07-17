import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: ElevatedButton(
          child: Text('Dashboard View ${controller.count}'),
          onPressed: () {
            controller.count.value++;
          },
        ),
      ),
    );
  }
}
