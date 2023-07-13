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
    return SizedBox(
      height: 80,
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
