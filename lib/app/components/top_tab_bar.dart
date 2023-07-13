import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/extensions/widgets.dart';
import 'package:ugodubai/app/widgets/custom_tab.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      isScrollable: true,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 12),
      indicatorWeight: 0,
      labelPadding: EdgeInsets.symmetric(horizontal: 16),
      tabs: [
        CustomTab(
          height: 30,
          text: '代理商列表',
          iconMargin: EdgeInsets.zero,
          icon: InkWell(
            child: Icon(
              Icons.close,
              size: 14,
            ),
            onTap: () {},
          ).paddingOnly(left: 8),
        ),
        CustomTab(
          height: 30,
          text: '代理商列表',
          iconMargin: EdgeInsets.zero,
          icon: InkWell(
            child: Icon(
              Icons.close,
              size: 14,
            ),
            onTap: () {},
          ).paddingOnly(left: 8),
        ),
      ],
    );
  }
}
