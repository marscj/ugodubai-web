import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

import 'package:ugodubai/app.dart';

import 'package:ugodubai/app/widgets/custom_pop_menu.dart';
import 'package:ugodubai/utils/constants.dart';

class LanguageMenu extends StatefulWidget {
  const LanguageMenu({Key? key}) : super(key: key);

  @override
  State<LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<LanguageMenu> {
  Function? callBack;

  @override
  Widget build(BuildContext context) {
    Locale? locale = Get.locale;

    return CustomPopupMenu(
      backdrop: true,
      hideFn: (_) => callBack = _,
      onChange: (_) {},
      offsetX: -36,
      menu: Padding(
        padding: FxSpacing.xy(8, 8),
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(2),
          child: SvgPicture.asset(
            width: 24,
            height: 18,
            'assets/lang/${locale?.languageCode}.svg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      menuBuilder: (_) => LanguageWidget(
        callBack: callBack,
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
    this.callBack,
  }) : super(key: key);

  final Function? callBack;

  @override
  Widget build(BuildContext context) {
    return FxContainer.bordered(
      padding: FxSpacing.xy(8, 8),
      width: 125,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: languages
            .map((language) => FxButton.text(
                  padding: FxSpacing.xy(8, 4),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // splashColor: contentTheme.onBackground.withAlpha(20),
                  onPressed: () {
                    callBack?.call();
                    Get.find<AppController>().chageLanguage(language.locale);
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(2),
                        child: SvgPicture.asset(
                          width: 18,
                          height: 14,
                          'assets/lang/${language.locale.languageCode}.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      FxSpacing.width(8),
                      FxText.labelMedium(language.languageName)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
