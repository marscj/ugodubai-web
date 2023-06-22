import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:ugodubai/app/components/account_menu.dart';
import 'package:ugodubai/app/components/language_menu.dart';
import 'package:ugodubai/app/components/notification_menu.dart';
import 'package:ugodubai/app/components/search_menu.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.leftBarFun});

  final Function leftBarFun;

  @override
  Widget build(BuildContext context) {
    return FxCard(
      shadow: FxShadow(position: FxShadowPosition.bottomRight, elevation: 0.5),
      height: 60,
      borderRadiusAll: 0,
      padding: FxSpacing.x(24),
      color: Theme.of(context).colorScheme.onPrimary,
      child: [
        [
          InkWell(
            splashColor: colorScheme.onBackground,
            highlightColor: colorScheme.onBackground,
            onTap: () {
              leftBarFun.call();
            },
            child: DrawerButtonIcon(),
          ),
          FxSpacing.width(24),
          SearchMenu(),
        ].row(),
        [
          LanguageMenu(),
          FxSpacing.width(6),
          NotificationMenu(),
          FxSpacing.width(6),
          AccountMenu(),
        ].row(ma: MainAxisAlignment.end).expanded
      ].row(),
    );
  }
}
