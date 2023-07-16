import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:collection/collection.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/account_menu.dart';
import 'package:ugodubai/app/components/language_menu.dart';
import 'package:ugodubai/app/components/left_bar.dart';
import 'package:ugodubai/app/components/notification_menu.dart';
import 'package:ugodubai/app/components/top_bar.dart';
import 'package:ugodubai/app/components/top_tab_bar.dart';
import 'package:ugodubai/app/extensions/base.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/app/widgets/page_tabbar.dart';

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
  final List<PageTabBar> tabs = [];
  final List<GetPage> pages = [];
  final GlobalKey<TopTabBarState> tabKey = GlobalKey<TopTabBarState>();
  int index = 0;

  @override
  void initState() {
    super.initState();

    tabs.addAll([
      PageTabBar(
        title: 'dashboard'.tr,
        route: Routes.DASHBOARD,
      ),
    ]);

    pages.addAll([AppPages.findPage('/dashboard')]);

    addPage();

    Get.rootDelegate.addListener(() {
      addPage();
    });
  }

  void addPage() {
    GetPage? page = Get.rootDelegate.currentConfiguration?.currentPage;
    String? route = Get.rootDelegate.currentConfiguration!.location;
    var equals = DeepCollectionEquality().equals;

    tabs.map((element) {
      if (kDebugMode) {
        print(
            'arguments = ${element.arguments}, ${page?.arguments}, ${equals(element.arguments, page?.arguments)}');
      }
      if (kDebugMode) {
        print(
            'parameters = ${element.parameters}, ${page?.parameters}, ${equals(element.parameters, page?.parameters)}');
      }
    }).toList();

    if (page != null && route != null) {
      if (!tabs.any((element) =>
          element.route == page.name &&
          equals(element.arguments, page.arguments) &&
          equals(element.parameters, page.parameters))) {
        setState(() {
          tabs.add(
            PageTabBar(
              title: page.title!.tr,
              route: route,
              arguments: page.arguments,
              parameters: page.parameters,
            ),
          );
          pages.add(page);
          index++;
          tabKey.currentState?.changeIndex(tabs.length - 1);
        });
      } else {
        index = tabs.indexWhere((element) =>
            element.route == page.name &&
            equals(element.arguments, page.arguments) &&
            equals(element.parameters, page.parameters));
        tabKey.currentState?.changeIndex(index);
      }
    }
  }

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
              padding: EdgeInsets.symmetric(horizontal: 24),
              shadow: FxShadow(
                  position: FxShadowPosition.bottomRight, elevation: 1),
              color: Theme.of(context).colorScheme.onPrimary,
              child: [
                TopBar(leftBarFun: toggleLeftBarCondensed),
                TopTabBar(
                  key: tabKey,
                  tabs: tabs,
                  initialIndex: index,
                  onChange: (value) {
                    setState(() {
                      index = value;
                      delegate.offNamed(tabs[value].route);
                    });
                  },
                )
              ].col(),
            ),
            IndexedStack(
              index: index,
              children: pages.map((e) {
                return e.page();
              }).toList(),
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
