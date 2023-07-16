import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/widgets/custom_tab.dart';

class PageTabBar extends StatelessWidget {
  const PageTabBar({
    Key? key,
    required this.title,
    required this.route,
    required this.page,
    this.onClosed,
  }) : super(key: key);

  final String title;
  final ValueChanged<GetPage>? onClosed;
  final String route;
  final GetPage page;

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      height: 30,
      text: title,
      iconMargin: EdgeInsets.zero,
      icon: onClosed != null
          ? InkWell(
              onTap: () => onClosed!(page),
              child: Icon(
                Icons.close,
                size: 14,
              ),
            ).paddingOnly(left: 4)
          : SizedBox.shrink(),
    ).paddingOnly(left: 4);
  }
}
