import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:ugodubai/pack/syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/extensions/widget.dart';

import '../controllers/menu_list_controller.dart';

class MenuListView extends GetView<MenuListController> {
  const MenuListView({Key? key}) : super(key: key);
  Widget _buildDataGrid(context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () {
        return SfDataGridTheme(
          data: SfDataGridThemeData(
            brightness: colorScheme.brightness,
            headerHoverColor: Colors.white.withOpacity(0.1),
            headerColor: colorScheme.primary,
          ),
          child: SfDataGrid(
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            footerFrozenColumnsCount: 1,
            source: controller.source,
            rowsPerPage: controller.source.rowsPerPage,
            onCellTap: (details) {},
            columnWidthMode: ColumnWidthMode.fill,
            rowHeight: 60,
            allowColumnsResizing: true,
            columnResizeMode: ColumnResizeMode.onResize,
            columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
            onColumnResizeUpdate: (ColumnResizeUpdateDetails args) {
              return true;
            },
            columns: controller.source.dataGridColumn,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxCard(
      color: Colors.white,
      margin: EdgeInsets.all(24),
      child: _buildDataGrid(context),
    );
  }
}
