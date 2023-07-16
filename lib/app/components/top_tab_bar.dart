import 'package:flutter/material.dart';

import 'package:ugodubai/app/widgets/custom_tab.dart';
import 'package:ugodubai/app/widgets/page_tabbar.dart';

class TopTabBar extends StatefulWidget {
  const TopTabBar({
    super.key,
    this.tabs = const [],
    this.controller,
    required this.onChange,
    required this.initialIndex,
  });

  final TabController? controller;
  final List<PageTabBar> tabs;
  final ValueChanged<int> onChange;
  final int initialIndex;

  @override
  State<StatefulWidget> createState() => TopTabBarState();
}

class TopTabBarState extends State<TopTabBar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initialIndex);
  }

  void changeIndex(index) {
    tabController = TabController(
        length: widget.tabs.length, vsync: this, initialIndex: index);
    tabController.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      controller: tabController,
      // physics: NeverScrollableScrollPhysics(),
      isScrollable: true,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 12),
      indicatorWeight: 0,
      labelPadding: EdgeInsets.symmetric(horizontal: 16),
      tabs: widget.tabs,
      onTap: (index) {
        widget.onChange(index);
      },
    );
  }
}
