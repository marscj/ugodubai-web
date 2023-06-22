import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:ugodubai/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await GetStorage.init();

  Get.put(AppController());

  runApp(App());
}
