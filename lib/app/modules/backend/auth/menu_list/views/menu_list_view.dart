import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/data/menu_model.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/modules/backend/auth/menu_list/controllers/menu_item_controller.dart';
import 'package:ugodubai/app/modules/backend/auth/menu_list/controllers/menu_list_controller.dart';

class MenuListView extends GetView<MenuListController> {
  const MenuListView({Key? key}) : super(key: key);

  Widget _buildLayoutBuilder(context) {
    return Obx(() {
      return controller.menus
          .map<Widget>((value) {
            return ExpansionTileTheme(
              data: ExpansionTileThemeData(),
              child: ExpansionTile(
                title: Text(value.title!),
                controlAffinity: ListTileControlAffinity.leading,
                children: value.children
                        ?.map<Widget>((value) {
                          return MenuItemWidget(value, key: ValueKey(value));
                        })
                        .toList()
                        .divider(context: context) ??
                    [],
              ),
            );
          })
          .toList()
          .divider(context: context)
          .col()
          .list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FxCard(
      color: Colors.white,
      margin: EdgeInsets.all(24),
      child: _buildLayoutBuilder(context),
    );
  }
}

class MenuItemWidget extends GetWidget<MenuItemController> {
  final Menu data;

  const MenuItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title!),
    );
  }
}
