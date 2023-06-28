import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');

  String get toTitleFlgCase =>
      replaceAll('_', ' ').split(' ').map((str) => str.toCapitalized).join(' ');

  Text get text => Text(this);
}
