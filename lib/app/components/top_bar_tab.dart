import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

import 'package:ugodubai/app/components/account_menu.dart';
import 'package:ugodubai/app/components/language_menu.dart';
import 'package:ugodubai/app/components/notification_menu.dart';
import 'package:ugodubai/app/components/search_menu.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/widgets/custom_tab.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.leftBarFun});

  final Function leftBarFun;

  @override
  Widget build(BuildContext context) {
    return FxCard(
      shadow: FxShadow(position: FxShadowPosition.bottomRight, elevation: 0.2),
      // height: 160,
      borderRadiusAll: 0,
      padding: FxSpacing.x(24),
      color: Theme.of(context).colorScheme.onPrimary,
      child: [
        [
          [
            InkWell(
              splashColor: colorScheme.onBackground,
              highlightColor: colorScheme.onBackground,
              onTap: () {
                leftBarFun.call();
              },
              child: DrawerButtonIcon(),
            ),
            FxSpacing.width(24),
            SearchMenu(),
          ].row(),
          [
            LanguageMenu(),
            FxSpacing.width(6),
            NotificationMenu(),
            FxSpacing.width(6),
            AccountMenu(),
          ].row(ma: MainAxisAlignment.end).expanded
        ].row().paddingSymmetric(vertical: 16),
        Divider(),
        DefaultTabController(
          length: 2,
          child: CustomTabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 12),
            indicatorWeight: 0,
            labelPadding: EdgeInsets.symmetric(horizontal: 16),
            tabs: [
              CustomTab(
                height: 30,
                text: '代理商列表',
                iconMargin: EdgeInsets.zero,
                icon: InkWell(
                  child: Icon(
                    Icons.close,
                    size: 14,
                  ),
                  onTap: () {},
                ).paddingOnly(left: 8),
              ),
              CustomTab(
                height: 30,
                text: '代理商列表',
                iconMargin: EdgeInsets.zero,
                icon: InkWell(
                  child: Icon(
                    Icons.close,
                    size: 14,
                  ),
                  onTap: () {},
                ).paddingOnly(left: 8),
              ),
            ],
          ),
        )
      ].col(),
    );
  }
}
