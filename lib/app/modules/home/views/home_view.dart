import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView ${controller.count}'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.rootDelegate.offNamed(Routes.DASHBOARD);
            },
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            )),
      ),
    ).paddingAll(30);
  }
}
