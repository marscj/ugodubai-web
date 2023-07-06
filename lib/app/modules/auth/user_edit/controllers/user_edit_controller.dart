import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserEditController extends GetxController {
  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
