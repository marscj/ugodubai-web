import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agent_detail_controller.dart';

class AgentDetailView extends GetView<AgentDetailController> {
  const AgentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: ElevatedButton(
          child: Text(
              'AgentDetailView ${controller.count}, ${Get.parameters}, ${Get.arguments}, ${Uri.base.queryParameters} '),
          onPressed: () {
            controller.count.value++;
          },
        ),
      ),
    );
  }
}
