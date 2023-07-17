import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/role_detail_controller.dart';

class RoleDetailView extends GetView<RoleDetailController> {
  const RoleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: ElevatedButton(
          child: Text('RoleDetailView ${controller.count}'),
          onPressed: () {
            controller.count.value++;
          },
        ),
      ),
    );
  }
}
