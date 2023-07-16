import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingController(),
      builder: (SettingController controller) {
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
      },
    );
  }
}
