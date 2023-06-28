import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/data/user_model.dart';
import 'package:ugodubai/app/extensions/string.dart';
import 'package:ugodubai/app/extensions/widget.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Obx(
        () => PaginatedDataTable(
          header: 'login'.tr.text,
          dataRowMinHeight: 50,
          dataRowMaxHeight: 90,
          sortColumnIndex: controller.sortColumnIndex,
          sortAscending: controller.sortAscending,
          onSelectAll: controller.source.selectAll,
          onPageChanged: (rowIndex) {},
          onRowsPerPageChanged: (value) {},
          rowsPerPage: controller.rowsPerPage,
          columns: [
            DataColumn(
                label: 'ID'.text,
                onSort: (columnIndex, ascending) =>
                    controller.sort<num>((d) => d.id!, columnIndex, ascending)),
          ],
          source: controller.source,
        ).list,
      ),
    );
  }
}
