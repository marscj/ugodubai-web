import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  void sprint([flg]) {
    if (kDebugMode) {
      print('${flg ?? '====='},$this');
    }
  }
}

extension InterExtension on int {
  bool get toBool => this == 1;
}
