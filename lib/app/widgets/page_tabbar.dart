import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/widgets/custom_tab.dart';

class PageTabBar extends StatelessWidget {
  const PageTabBar({
    Key? key,
    required this.title,
    required this.route,
    this.arguments,
    this.parameters,
    this.onClosed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onClosed;
  final String route;
  final Object? arguments;
  final Map<String, String>? parameters;

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      height: 30,
      text: title,
      iconMargin: EdgeInsets.zero,
      icon: onClosed != null
          ? InkWell(
              onTap: onClosed,
              child: Icon(
                Icons.close,
                size: 14,
              ),
            ).paddingOnly(left: 8)
          : SizedBox.shrink(),
    );
  }
}
