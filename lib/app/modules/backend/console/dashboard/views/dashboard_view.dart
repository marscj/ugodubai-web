import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: TextButton(
          child: Text('Dashboard View ${controller.count}'),
          onPressed: () {
            controller.count.value++;
            launchUrl(Uri(path: '/backend/order/list'));
          },
        ),
      ),
    );
  }
}
