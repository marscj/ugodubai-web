import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_list_controller.dart';

class MenuListView extends GetView<MenuListController> {
  const MenuListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenuListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MenuListView is working ${controller.count}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
