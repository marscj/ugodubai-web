import 'package:get/get.dart';

import '../controllers/agent_list_controller.dart';

class AgentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentListController>(
      () => AgentListController(),
    );
  }
}
