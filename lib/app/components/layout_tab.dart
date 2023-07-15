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
import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/app/widgets/page_tabbar.dart';

class LayoutTab extends StatefulWidget {
  const LayoutTab(
      {super.key, required this.initialRoute, required this.anchorRoute});

  final String initialRoute;
  final String anchorRoute;

  @override
  State<StatefulWidget> createState() => _LayoutTabState();
}

class _LayoutTabState extends State<LayoutTab>
    with SingleTickerProviderStateMixin {
  ConsoleController consoleController = Get.find<ConsoleController>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<PageTabBar> _tabs = [];
  final List<GetPage> _pages = [];

  late TabController _tabController;

  int currentPageIndex = 0;
  bool extended = false;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(vsync: this, length: 2, animationDuration: Duration.zero);

    Get.rootDelegate.addListener(
      () {
        // print(Get.rootDelegate.currentConfiguration?.location);
        if (mounted) setState(() {});
      },
    );

    _pages.add(AppPages.routes.first.children
        .lastWhere((element) => element.name == Routes.CONSOLE)
        .children
        .first);

    _tabs.add(PageTabBar(
      title: '工作台',
    ));

    addPage(true);

    if (mounted) {
      setState(() {});
    }
    // print('initState');
  }

  void addPage(bool b) {
    _tabs.add(PageTabBar(
      title: '代理商列表 + ${_tabs.length + 1}',
      onClosed: () {},
    ));

    if (b) {
      _pages.add(GetPage(
          name: '/agent/agent/list',
          page: () => TextButton(
                child: Text('data2'),
                onPressed: () {
                  addPage(true);
                },
              )));
    }

    setState(() {});
  }

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
      body: [
        LeftBar(leftBarCondensed: consoleController.leftBarCondensed),
        [
          FxCard(
            borderRadiusAll: 0,
            padding: EdgeInsets.symmetric(horizontal: 24),
            shadow:
                FxShadow(position: FxShadowPosition.bottomRight, elevation: 1),
            color: Theme.of(context).colorScheme.onPrimary,
            child: [
              TopBar(leftBarFun: toggleLeftBarCondensed),
              TopTabBar(
                tabs: _tabs,
                controller: _tabController,
              ),
            ].col(),
          ),

          TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: _pages.map<Widget>((page) {
              return page.page();
            }).toList(),
          ).expanded
          // widget.child.paddingAll(24).expanded
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
      drawer: LeftBar(leftBarCondensed: consoleController.leftBarCondensed),
      body: GetRouterOutlet.builder(
        builder: (context, delegate, current) {
          return GetRouterOutlet(
            delegate: delegate,
            initialRoute: Routes.USER_LIST,
            anchorRoute: Routes.AUTH,
            filterPages: (afterAnchor) => afterAnchor.take(1),
          );
        },
      ),
    );
  }
}
