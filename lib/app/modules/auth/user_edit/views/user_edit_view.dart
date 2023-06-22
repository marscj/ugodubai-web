import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_edit_controller.dart';

class UserEditView extends GetView<UserEditController> {
  const UserEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
