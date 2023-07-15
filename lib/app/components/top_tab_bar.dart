import 'package:flutter/material.dart';

import 'package:ugodubai/app/widgets/custom_tab.dart';
import 'package:ugodubai/app/widgets/page_tabbar.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({
    super.key,
    this.tabs = const [],
    required this.controller,
  });

  final TabController controller;
  final List<PageTabBar> tabs;

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      controller: this.controller,
      physics: NeverScrollableScrollPhysics(),
      isScrollable: true,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 12),
      indicatorWeight: 0,
      labelPadding: EdgeInsets.symmetric(horizontal: 16),
      tabs: tabs,
    );
  }
}
