import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        maxLines: 1,
        style: FxTextStyle.bodyMedium(),
        decoration: InputDecoration(
            hintText: "search".tr,
            hintStyle: FxTextStyle.bodySmall(xMuted: true),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1,
                  strokeAlign: 0,
                  color: colorScheme.onBackground.withAlpha(80)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1,
                  strokeAlign: 0,
                  color: colorScheme.onBackground.withAlpha(80)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: colorScheme.primary),
            ),
            prefixIcon: Align(
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 14,
                )),
            prefixIconConstraints: BoxConstraints(
                minWidth: 36, maxWidth: 36, minHeight: 32, maxHeight: 32),
            contentPadding: FxSpacing.xy(16, 12),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    );
  }
}
