import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');

  String get toTitleFlgCase =>
      replaceAll('_', ' ').split(' ').map((str) => str.toCapitalized).join(' ');

  Text get text => Text(this);

  TextButton textButton(onPressed) =>
      TextButton(onPressed: onPressed, child: Text(this));

  TextButton url(href) => textButton(() => launchUrl(Uri(path: href)));

  void sprint([flg]) {
    if (kDebugMode) {
      print('${flg ?? '====='},$this');
    }
  }

  List<String> list({flg = ','}) => this.split(flg);
}

extension InterExtension on int {
  bool get toBool => this == 1;
}
