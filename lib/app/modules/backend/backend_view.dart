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
import 'package:ugodubai/app/routes/app_pages.dart';

class BackendView extends StatelessWidget {
  const BackendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxResponsive(builder: (BuildContext context, _, screenMT) {
      return screenMT.isMobile ? MobileScreen() : DesktopScreen();
    });
  }
}

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
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
    return GetRouterOutlet.builder(builder: (context, delegate, current) {
      return Scaffold(
        body: [
          LeftBar(leftBarCondensed: leftBarCondensed),
          [
            FxCard(
              borderRadiusAll: 0,
              padding: EdgeInsets.zero,
              shadow: FxShadow(
                  position: FxShadowPosition.bottomRight, elevation: 0.35),
              color: Theme.of(context).colorScheme.onPrimary,
              child: [
                TopBar(leftBarFun: toggleLeftBarCondensed)
                    .paddingSymmetric(horizontal: 24),
              ].col(),
            ),
            GetRouterOutlet(
              key: Get.nestedKey(Routes.BACKEND),
              delegate: delegate,
              initialRoute: Routes.CONSOLE,
              anchorRoute: Routes.BACKEND,
              filterPages: (afterAnchor) => afterAnchor.take(1),
            ).expanded
          ].col().expanded
        ].row(),
      );
    });
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  final bool leftBarCondensed = false;

  @override
  Widget build(BuildContext context) {
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
      body: GetRouterOutlet.builder(
        builder: (context, delegate, current) {
          return GetRouterOutlet(
            key: Get.nestedKey(Routes.BACKEND),
            delegate: delegate,
            initialRoute: Routes.CONSOLE,
            anchorRoute: Routes.BACKEND,
            filterPages: (afterAnchor) => afterAnchor.take(1),
          );
        },
      ),
    );
  }
}
