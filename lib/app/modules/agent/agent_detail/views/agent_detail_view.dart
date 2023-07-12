import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';

import '../controllers/agent_detail_controller.dart';

class AgentDetailView extends GetView<AgentDetailController> {
  const AgentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: ElevatedButton(
          child: Text('AgentDetailView'),
          onPressed: () {},
        ),
      ),
    );
  }
}
