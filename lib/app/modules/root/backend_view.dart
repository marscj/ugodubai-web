import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/left_bar.dart';
import 'package:ugodubai/app/components/top_bar.dart';
import 'package:ugodubai/app/components/top_tab_bar.dart';
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
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabs.addAll([
      PageTabBar(
        title: '工作台',
        route: Routes.DASHBOARD,
      ),
      PageTabBar(
        title: '个人中心',
        route: Routes.PROFILE,
      ),
    ]);

    pages.addAll(
        [AppPages.findPage('/dashboard'), AppPages.findPage('/profile')]);
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
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          body: [
            LeftBar(leftBarCondensed: leftBarCondensed),
            [
              FilledButton(
                  onPressed: () {
                    tabs.add(
                      PageTabBar(
                        title: '网站设置',
                        route: Routes.SETTING,
                        onClosed: () {
                          setState(() {
                            index = 1;
                            tabs.removeLast();
                            pages.removeLast();
                          });
                        },
                      ),
                    );
                    pages.add(AppPages.findPage('/setting'));
                    setState(() {});
                  },
                  child: Text('add tab')),
              FxCard(
                borderRadiusAll: 0,
                padding: EdgeInsets.symmetric(horizontal: 24),
                shadow: FxShadow(
                    position: FxShadowPosition.bottomRight, elevation: 1),
                color: Theme.of(context).colorScheme.onPrimary,
                child: [
                  TopBar(leftBarFun: toggleLeftBarCondensed),
                  TopTabBar(
                      tabs: tabs,
                      onChange: (value) {
                        setState(() {
                          index = value;
                          delegate.offNamed(tabs[value].route);
                        });
                      }),
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
      },
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('mobile');
  }
}

class GetPageView extends StatelessWidget {
  const GetPageView({super.key, required this.page});

  final GetPage page;

  @override
  Widget build(BuildContext context) {
    // page.binding?.dependencies();
    return GetBuilder(
      initState: (state) {},
      builder: (GetxController controller) {
        return page.page();
      },
    );
  }
}
