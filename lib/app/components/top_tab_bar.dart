import 'package:flutter/material.dart';

import 'package:ugodubai/app/widgets/custom_tab.dart';
import 'package:ugodubai/app/widgets/page_tabbar.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({
    super.key,
    this.tabs = const [],
    this.controller,
    required this.onChange,
  });

  final TabController? controller;
  final List<PageTabBar> tabs;
  final ValueChanged<int> onChange;

  Widget tab(context) => CustomTabBar(
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
        onTap: (index) {
          onChange(index);
        },
      );

  @override
  Widget build(BuildContext context) {
    return controller != null
        ? tab(context)
        : DefaultTabController(length: tabs.length, child: tab(context));
  }
}
