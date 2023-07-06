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
  });

  Widget _buildDataGrid(context) {
    final UserListController _controller = Get.find<UserListController>();
    final colorScheme = Theme.of(context).colorScheme;
    return Obx(
      () {
        return SfDataGridTheme(
          data: SfDataGridThemeData(
              brightness: colorScheme.brightness,
              headerHoverColor: Colors.white.withOpacity(0.4),
              headerColor: colorScheme.surfaceTint),
          child: SfDataGrid(
            // controller: _controller.dataGridController,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            footerFrozenColumnsCount: 1,
            source: _controller.source,
            rowsPerPage: _controller.rowsPerPage,
            columnWidthMode: ColumnWidthMode.fill,
            rowHeight: 60,
            allowColumnsResizing: true,
            columnResizeMode: ColumnResizeMode.onResize,
            columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
            onColumnResizeUpdate: (ColumnResizeUpdateDetails args) {
              return true;
            },
            columns: <GridColumn>[
              GridColumn(
                columnName: 'id',
                label: 'ID'.tr.text.white.bold.paddingAll(16),
                width: 60,
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
                columnWidthMode: ColumnWidthMode.fitByColumnName,
              ),
              GridColumn(
                columnName: 'action',
                label: 'Actions'.tr.text.white.bold.paddingAll(16),
                width: 100,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataPager(context) {
    final UserListController _controller = Get.find<UserListController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(() => _controller.total > _controller.rowsPerPage
        ? SfDataPagerTheme(
            data: SfDataPagerThemeData(
              brightness: colorScheme.brightness,
              selectedItemColor: colorScheme.surfaceTint,
            ),
            child: SfDataPager(
              delegate: _controller.source,
              // controller: _controller.dataPagerController,
              availableRowsPerPage: <int>[10, 20, 21],
              pageCount: _controller.pageCount,
              onRowsPerPageChanged: (int? rowsPerPage) {
                _controller.rowsPerPage = rowsPerPage!;
                _controller.dataPagerController.firstPage();
              },
            ),
          )
        : SizedBox.shrink());
  }

  Widget _buildLayoutBuilder(context) {
    return Column(
      children: <Widget>[
        _buildDataGrid(context).expanded,
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.12),
            border: Border(
              top: BorderSide(
                width: .5,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              ),
            ),
          ),
          child: Align(child: _buildDataPager(context)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayoutBuilder(context);
  }
}
