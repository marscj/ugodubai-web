import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agent_detail_controller.dart';

class AgentDetailView extends StatelessWidget {
  const AgentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AgentDetailController(),
      builder: (AgentDetailController controller) {
        return Obx(
          () => Center(
            child: ElevatedButton(
              child: Text('AgentDetailView ${controller.count}'),
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
