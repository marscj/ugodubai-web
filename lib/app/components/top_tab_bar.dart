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

    changeIndex(0);
  }

  void changeIndex(index) {
    tabController = TabController(length: widget.tabs.length, vsync: this);
    tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      controller: tabController,
      physics: NeverScrollableScrollPhysics(),
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


// class TopTabBar extends StatelessWidget {
//   const TopTabBar({
//     super.key,
//     this.tabs = const [],
//     this.controller,
//     required this.onChange,
//     required this.initialIndex,
//   });

//   final TabController? controller;
//   final List<PageTabBar> tabs;
//   final ValueChanged<int> onChange;
//   final int initialIndex;

//   Widget tab(context) => CustomTabBar(
//         physics: NeverScrollableScrollPhysics(),
//         isScrollable: true,
//         dividerColor: Colors.transparent,
//         indicatorColor: Colors.transparent,
//         labelColor: Theme.of(context).colorScheme.primary,
//         unselectedLabelColor: Colors.black,
//         labelStyle: TextStyle(fontSize: 12),
//         indicatorWeight: 0,
//         labelPadding: EdgeInsets.symmetric(horizontal: 16),
//         tabs: tabs,
//         onTap: (index) {
//           onChange(index);
//         },
//       );

//   @override
//   Widget build(BuildContext context) {
//     return controller != null
//         ? tab(context)
//         : DefaultTabController(
//             key: key,
//             length: tabs.length,
//             initialIndex: initialIndex,
//             child: tab(context),
//           );
//   }
// }
