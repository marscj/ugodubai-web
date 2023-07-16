import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

import 'package:ugodubai/app/components/account_menu.dart';
import 'package:ugodubai/app/components/language_menu.dart';
import 'package:ugodubai/app/components/left_bar.dart';
import 'package:ugodubai/app/components/notification_menu.dart';
import 'package:ugodubai/app/components/top_bar.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

class Layout extends StatefulWidget {
  const Layout({super.key, required this.child});

  final Widget child;
  @override
  State<StatefulWidget> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool rightBarOpen = false;
  bool leftBarCondensed = false;

  void openRightBar(bool opened) {
    setState(() {
      rightBarOpen = opened;
    });
  }

  void toggleLeftBarCondensed() {
    setState(() {
      leftBarCondensed = !leftBarCondensed;
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
      body: [
        LeftBar(leftBarCondensed: leftBarCondensed),
        [
          FxCard(
            borderRadiusAll: 0,
            padding: EdgeInsets.symmetric(horizontal: 24),
            shadow:
                FxShadow(position: FxShadowPosition.bottomRight, elevation: 1),
            color: Theme.of(context).colorScheme.onPrimary,
            child: TopBar(leftBarFun: toggleLeftBarCondensed),
          ),
          widget.child.expanded,
        ].col().expanded
      ].row(),
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
      drawer: LeftBar(leftBarCondensed: leftBarCondensed),
      body: widget.child,
    );
  }
}
