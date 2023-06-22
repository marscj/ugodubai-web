import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/role_list_controller.dart';

class RoleListView extends GetView<RoleListController> {
  const RoleListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoleListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RoleListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
