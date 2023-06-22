import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ugodubai/app/widgets/custom_pop_menu.dart';

class NotificationMenu extends StatefulWidget {
  const NotificationMenu({Key? key}) : super(key: key);

  @override
  State<NotificationMenu> createState() => _NotificationMenutState();
}

class _NotificationMenutState extends State<NotificationMenu> {
  Function? callBack;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      backdrop: true,
      onChange: (_) {},
      offsetX: -120,
      menu: Padding(
        padding: FxSpacing.xy(8, 8),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.bell,
            size: 18,
          ),
        ),
      ),
      menuBuilder: (_) => NotificationWidget(),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
  }) : super(key: key);

  Widget buildNotification(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.labelLarge(title),
        FxSpacing.height(4),
        FxText.bodySmall(description)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxContainer.bordered(
      paddingAll: 0,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: FxSpacing.xy(16, 12),
            child: FxText.titleMedium("Notification", fontWeight: 600),
          ),
          FxDashedDivider(
              height: 1, color: theme.dividerColor, dashSpace: 4, dashWidth: 6),
          Padding(
            padding: FxSpacing.xy(16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNotification("Your order is received",
                    "Order #1232 is ready to deliver"),
                FxSpacing.height(12),
                buildNotification("Account Security ",
                    "Your account password changed 1 hour ago"),
              ],
            ),
          ),
          FxDashedDivider(
              height: 1, color: theme.dividerColor, dashSpace: 4, dashWidth: 6),
          Padding(
            padding: FxSpacing.xy(16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxButton.text(
                  onPressed: () {},
                  // splashColor: contentTheme.primary.withAlpha(28),
                  child: FxText.labelSmall(
                    "View All",
                    // color: contentTheme.primary,
                  ),
                ),
                FxButton.text(
                  onPressed: () {},
                  // splashColor: contentTheme.danger.withAlpha(28),
                  child: FxText.labelSmall(
                    "Clear",
                    // color: contentTheme.danger,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
