import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ugodubai/services/auth_service.dart';

import 'package:ugodubai/utils/assets.dart';
import 'package:ugodubai/app/widgets/custom_pop_menu.dart';

class AccountMenu extends StatefulWidget {
  const AccountMenu({Key? key}) : super(key: key);

  @override
  State<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  Function? callBack;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      backdrop: true,
      onChange: (_) {},
      offsetX: -60,
      offsetY: 8,
      menu: Padding(
        padding: FxSpacing.xy(8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FxContainer.rounded(
                paddingAll: 0,
                child: Image.asset(
                  Assets.avatars[0],
                  height: 28,
                  width: 28,
                  fit: BoxFit.cover,
                )),
            FxSpacing.width(8),
            FxText.labelLarge(
              "Den",
            )
          ],
        ),
      ),
      menuBuilder: (_) => AccountWidget(),
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxContainer.bordered(
      paddingAll: 0,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: FxSpacing.xy(8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxButton(
                  onPressed: () {},
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // borderRadiusAll: AppStyle.buttonRadius.medium,
                  padding: FxSpacing.xy(8, 4),
                  splashColor: colorScheme.onBackground.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.user,
                        size: 14,
                      ),
                      FxSpacing.width(8),
                      FxText.labelMedium(
                        "My Account",
                        fontWeight: 600,
                      )
                    ],
                  ),
                ),
                FxSpacing.height(4),
                FxButton(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () => {},
                  // borderRadiusAll: AppStyle.buttonRadius.medium,
                  padding: FxSpacing.xy(8, 4),
                  splashColor: colorScheme.onBackground.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.gears,
                        size: 14,
                      ),
                      FxSpacing.width(8),
                      FxText.labelMedium(
                        "Settings",
                        fontWeight: 600,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: FxSpacing.xy(8, 8),
            child: FxButton(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                AuthService.to.logout();
              },
              padding: FxSpacing.xy(8, 4),
              backgroundColor: Colors.transparent,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    size: 14,
                  ),
                  FxSpacing.width(8),
                  FxText.labelMedium(
                    'logout1'.tr,
                    fontWeight: 600,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
