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
  final List<Widget> _pages = [];
  late TabController _tabController;

  int currentPageIndex = 0;
  bool extended = false;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(vsync: this, length: 2, animationDuration: Duration.zero);

    _tabController.addListener(() {});

    Get.rootDelegate.addListener(
      () {
        Get.rootDelegate.history.toList().map((e) {
          print(e.location);
        });
      },
    );

    _tabs.add(PageTabBar(
      title: '代理商列表',
      onClosed: () {},
    ));

    _pages.add(Container(
      child: TextButton(
        child: Text('data2'),
        onPressed: () {
          Get.rootDelegate.offNamed(Routes.USER_DETAIL);
        },
      ),
    ));

    if (mounted) {
      setState(() {});
    }
  }

  void addPage() {}

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
          GetRouterOutlet.builder(
            builder: (context, delegate, current) {
              return GetRouterOutlet(
                delegate: delegate,
                initialRoute: widget.initialRoute,
                anchorRoute: widget.anchorRoute,
                filterPages: (afterAnchor) => afterAnchor.take(1),
              );
            },
          ).expanded,
          // TabBarView(
          //     controller: _tabController,
          //     physics: NeverScrollableScrollPhysics(),
          //     children: [
          //       Container(
          //         child: TextButton(
          //           child: Text('data1'),
          //           onPressed: () {
          //             _tabController.animateTo(1);
          //           },
          //         ),
          //       ),
          //       ..._pages
          //     ]).expanded
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
