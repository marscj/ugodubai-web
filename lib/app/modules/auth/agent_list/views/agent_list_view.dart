import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agent_list_controller.dart';

class AgentListView extends GetView<AgentListController> {
  const AgentListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgentListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AgentListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
