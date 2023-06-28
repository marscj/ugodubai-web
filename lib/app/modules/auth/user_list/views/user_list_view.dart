import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/extensions/string.dart';
import 'package:ugodubai/app/extensions/widget.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Obx(() => DataTable(
            columns: [DataColumn(label: 'ID'.text)],
            rows: controller.userList
                .map((e) => DataRow(cells: [
                      DataCell(Text(e.id.toString())),
                    ]))
                .toList(),
          ).list),
    );
  }
}
