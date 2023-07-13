import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

import 'package:ugodubai/app/components/account_menu.dart';
import 'package:ugodubai/app/components/language_menu.dart';
import 'package:ugodubai/app/components/left_bar.dart';
import 'package:ugodubai/app/components/notification_menu.dart';
import 'package:ugodubai/app/components/top_bar.dart';
import 'package:ugodubai/app/components/top_tab_bar.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/modules/console/controllers/console_controller.dart';

class LayoutTab extends StatefulWidget {
  const LayoutTab({super.key, required this.child});

  final Widget child;
  @override
  State<StatefulWidget> createState() => _LayoutTabState();
}

class _LayoutTabState extends State<LayoutTab> {
  ConsoleController consoleController = Get.find<ConsoleController>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currentPageIndex = 0;
  bool extended = false;

  void openRightBar(bool opened) {
    setState(() {
      consoleController.rightBarOpen = opened;
    });
  }

  void toggleLeftBarCondensed() {
    setState(() {
      consoleController.leftBarCondensed = !consoleController.leftBarCondensed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FxResponsive(builder: (BuildContext context, _, screenMT) {
      return screenMT.isMobile ? mobileScreen() : largeScreen();
    });
  }

  Widget largeScreen() {
    return Scaffold(
      key: scaffoldKey,
      body: DefaultTabController(
        length: 2,
        child: [
          LeftBar(leftBarCondensed: consoleController.leftBarCondensed),
          [
            FxCard(
              borderRadiusAll: 0,
              padding: EdgeInsets.symmetric(horizontal: 24),
              shadow: FxShadow(
                  position: FxShadowPosition.bottomRight, elevation: 1),
              color: Theme.of(context).colorScheme.onPrimary,
              child: [
                TopBar(leftBarFun: toggleLeftBarCondensed),
                TopTabBar(),
              ].col(),
            ),
            widget.child.paddingAll(24).expanded
          ].col().expanded
        ].row(),
      ),
    );
  }

  Widget mobileScreen() {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        actions: [
          FxSpacing.width(6),
          LanguageMenu(),
          FxSpacing.width(6),
          NotificationMenu(),
          FxSpacing.width(6),
          AccountMenu(),
        ],
      ),
      drawer: LeftBar(leftBarCondensed: consoleController.leftBarCondensed),
      body: widget.child,
    );
  }
}
