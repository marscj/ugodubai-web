import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:ugodubai/pack/syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ugodubai/app/extensions/widget.dart';

import '../controllers/agent_list_controller.dart';

class AgentListView extends GetView<AgentListController> {
  const AgentListView({Key? key}) : super(key: key);
  Widget _buildDataGrid(context, controller) {
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
            columnWidthMode: ColumnWidthMode.auto,
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

  Widget _buildDataPager(context, controller) {
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(() => controller.source.dataGridRows.isNotEmpty
        ? SfDataPagerTheme(
            data: SfDataPagerThemeData(
              brightness: colorScheme.brightness,
              selectedItemColor: colorScheme.surfaceTint,
            ),
            child: SfDataPager(
              delegate: controller.source,
              availableRowsPerPage: <int>[20, 50, 100],
              pageCount: controller.source.pageCount,
              onRowsPerPageChanged: (int? rowsPerPage) {
                controller.getSource({
                  'pageSize': rowsPerPage,
                  'pageNum': 1,
                });
              },
            ),
          )
        : SizedBox.shrink());
  }

  Widget _buildLayoutBuilder(context, controller) {
    return Column(
      children: <Widget>[
        _buildDataGrid(context, controller).expanded,
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.12),
            border: Border(
              top: BorderSide(
                width: 2.5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          child: Align(child: _buildDataPager(context, controller)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxCard(
      color: Colors.white,
      // padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(24),
      child: _buildLayoutBuilder(context, controller),
    );
  }
}
