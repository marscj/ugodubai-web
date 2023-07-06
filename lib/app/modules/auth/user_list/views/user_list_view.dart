import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/text.dart';
import 'package:ugodubai/app/extensions/widget.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: UserListViewPage(),
    );
  }
}

class UserListViewPage extends StatelessWidget {
  const UserListViewPage({
    super.key,
    this.isDialog = false,
  });

  final bool isDialog;

  @override
  Widget build(BuildContext context) {
    final UserListController _controller = Get.find<UserListController>();
    final colorScheme = Theme.of(context).colorScheme;

    Widget content = Obx(
      () => SfDataGridTheme(
        data: SfDataGridThemeData(
            brightness: Theme.of(context).colorScheme.brightness,
            headerHoverColor: Colors.white.withOpacity(0.4),
            headerColor: Theme.of(context).colorScheme.surfaceTint),
        child: SfDataGrid(
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          footerFrozenColumnsCount: 1,
          source: _controller.source,
          columnWidthMode: ColumnWidthMode.fill,
          rowHeight: 60,
          allowColumnsResizing: true,
          columnResizeMode: ColumnResizeMode.onResize,
          onColumnResizeUpdate: (ColumnResizeUpdateDetails args) {
            if (args.column.columnName == 'id') {
              _controller.idColumnWidth = args.width;
            }
            return true;
          },
          columns: <GridColumn>[
            GridColumn(
              columnName: 'id',
              label: 'ID'.tr.text.white.bold.paddingAll(16),
              width: _controller.idColumnWidth,
            ),
            GridColumn(
              columnName: 'username',
              label: 'UserName'.tr.text.white.bold.paddingAll(16),
            ),
            GridColumn(
              columnName: 'email',
              label: 'Email'.tr.text.white.bold.paddingAll(16),
            ),
            GridColumn(
              columnName: 'active',
              label: 'Active'.tr.text.white.bold.paddingAll(16),
              width: 80,
            ),
            GridColumn(
              columnName: 'action',
              label: 'Actions'.tr.text.white.bold.paddingAll(16),
              width: 100,
            ),
          ],
        ),
      ),
    );

    if (isDialog) {
      content = Scaffold(
        appBar: AppBar(),
        body: content,
      );
    }
    return content;
  }
}
