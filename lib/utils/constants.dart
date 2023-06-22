import 'package:flutter/material.dart';

class Language {
  final Locale locale;
  final String languageName;

  Language(this.locale, this.languageName);
}

final List<Language> languages = [
  Language(Locale('en', 'US'), "English"),
  Language(Locale('zh', 'CN'), "中文简体"),
];
