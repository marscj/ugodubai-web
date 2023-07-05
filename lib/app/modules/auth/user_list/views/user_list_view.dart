import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/extensions/string.dart';
import 'package:ugodubai/app/extensions/widget.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Layout(child: Obx(
      () {
        return SfDataGrid(
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          footerFrozenColumnsCount: 1,
          source: controller.source,
          columnWidthMode: ColumnWidthMode.fill,
          rowHeight: 60,
          columns: <GridColumn>[
            GridColumn(
              columnName: 'id',
              label: 'ID'.tr.text.paddingAll(16),
              width: 60,
            ),
            GridColumn(
              columnName: 'username',
              label: 'UserName'.tr.text.paddingAll(16),
            ),
            GridColumn(
              columnName: 'email',
              label: 'Email'.tr.text.paddingAll(16),
            ),
            GridColumn(
              columnName: 'active',
              label: 'Active'.tr.text.paddingAll(16),
              width: 100,
            ),
          ],
        );
      },
    ));
  }
}
