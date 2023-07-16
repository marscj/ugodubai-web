import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';

import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/utils/assets.dart';
import 'package:ugodubai/app/components/left_menu_bar.dart';

class LeftBarTheme {
  final Color background, onBackground;
  final Color labelColor;
  final Color activeItemColor, activeItemBackground;

  LeftBarTheme({
    required this.background,
    required this.onBackground,
    required this.labelColor,
    required this.activeItemColor,
    required this.activeItemBackground,
  });

  static LeftBarTheme of(BuildContext context) {
    return LeftBarTheme(
      labelColor: Theme.of(context).colorScheme.onBackground,
      background: Theme.of(context).colorScheme.onPrimary,
      onBackground: Theme.of(context).colorScheme.onBackground,
      activeItemColor: Theme.of(context).colorScheme.primary,
      activeItemBackground:
          Theme.of(context).colorScheme.primary.withOpacity(0.22),
    );
  }
}

class LeftBar extends StatelessWidget {
  const LeftBar({super.key, required this.leftBarCondensed});

  final bool leftBarCondensed;

  @override
  Widget build(BuildContext context) {
    return FxCard(
      paddingAll: 0,
      margin: EdgeInsets.only(right: 1),
      shadow: FxShadow(
        position: FxShadowPosition.centerRight,
        elevation: 0.5,
      ),
      child: AnimatedContainer(
        color: LeftBarTheme.of(context).background,
        width: leftBarCondensed ? 70 : 244,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.rootDelegate.offNamed(Routes.DASHBOARD);
                    },
                    child: Image.asset(
                      Assets.logoIcon,
                      width: leftBarCondensed ? 40 : 70,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                  if (!leftBarCondensed)
                    Flexible(
                      fit: FlexFit.loose,
                      child: FxSpacing.width(16),
                    ),
                ],
              ).marginSymmetric(vertical: 10),
            ),
            Expanded(
              child: LeftMenuBar(leftBarCondensed: leftBarCondensed),
            ),
          ],
        ),
      ),
    );
  }
}
