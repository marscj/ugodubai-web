import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/role_detail_controller.dart';

class RoleDetailView extends GetView<RoleDetailController> {
  const RoleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoleDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RoleDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
