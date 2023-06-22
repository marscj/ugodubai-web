import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/app/components/layout.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: ElevatedButton(
          child: Text('Dashboard View'),
          onPressed: () {
            Get.rootDelegate.toNamed(Routes.ORDER);
          },
        ),
      ),
    );
  }
}
