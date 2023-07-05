import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/data/user_model.dart';
import 'package:ugodubai/app/extensions/string.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/widgets/custom_paginated_table.dart';
import 'package:ugodubai/app/widgets/sliver_header_delegate.dart';

import '../controllers/user_list_controller.dart';

class UserListView extends GetView<UserListController> {
  const UserListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Obx(
        () => CustomPaginatedDataTable(
          header: 'login'.tr.text,
          // dataRowMinHeight: 50,
          dataRowMaxHeight: 60,
          showCheckboxColumn: controller.showCheckboxColumn,
          showFirstLastButtons: true,
          sortColumnIndex: controller.sortColumnIndex,
          sortAscending: controller.sortAscending,
          rowsPerPage: controller.rowsPerPage,
          onSelectAll: controller.source.selectAll,
          onPageChanged: (rowIndex) {},
          onRowsPerPageChanged: (value) {},
          actions: [
            FilledButton(
                onPressed: () {
                  controller.showCheckboxColumn =
                      !controller.showCheckboxColumn;
                },
                child: 'select'.text)
          ],
          columns: [
            DataColumn(
              label: 'Id'.text,
              onSort: (columnIndex, ascending) =>
                  controller.sort<num>((d) => d.id!, columnIndex, ascending),
            ),
            DataColumn(
              label: 'Username'.text,
              onSort: (columnIndex, ascending) => controller.sort<String>(
                  (d) => d.userName!, columnIndex, ascending),
            ),
            // DataColumn(
            //   label: 'ID'.text,
            // ),
          ],
          source: controller.source,
        ).paddingAll(20).list,
      ),
    );
  }
}

class Talbe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StickyHeader(
        header: Container(
          height: 50.0,
          color: Colors.blueGrey[700],
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Header ',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        content: Column(
          children: [
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
