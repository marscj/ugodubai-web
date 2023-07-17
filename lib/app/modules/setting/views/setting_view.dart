import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: ElevatedButton(
          child: Text('Setting View ${controller.count}'),
          onPressed: () {
            controller.count.value++;
          },
        ),
      ),
    );
  }
}
