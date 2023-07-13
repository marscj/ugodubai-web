import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agent_detail_controller.dart';

class AgentDetailView extends GetView<AgentDetailController> {
  const AgentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('AgentDetailView'),
        onPressed: () {},
      ),
    );
  }
}
