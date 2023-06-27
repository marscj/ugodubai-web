import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String ads = controller.count.value.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          ads,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
