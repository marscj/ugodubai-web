import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text get s18 => Text(data!,
      style: style?.copyWith(fontSize: 18) ?? TextStyle(fontSize: 18));
  Text get s16 => Text(data!,
      style: style?.copyWith(fontSize: 16) ?? TextStyle(fontSize: 16));
  Text get s14 => Text(data!,
      style: style?.copyWith(fontSize: 14) ?? TextStyle(fontSize: 14));
  Text get s12 => Text(data!,
      style: style?.copyWith(fontSize: 12) ?? TextStyle(fontSize: 12));
  Text get s10 => Text(data!,
      style: style?.copyWith(fontSize: 10) ?? TextStyle(fontSize: 10));
  Text get s8 => Text(data!,
      style: style?.copyWith(fontSize: 8) ?? TextStyle(fontSize: 8));
}
