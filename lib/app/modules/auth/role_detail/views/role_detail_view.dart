import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/role_detail_controller.dart';

class RoleDetailView extends StatelessWidget {
  const RoleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RoleDetailController(),
      builder: (RoleDetailController controller) {
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
      },
    );
  }
}
