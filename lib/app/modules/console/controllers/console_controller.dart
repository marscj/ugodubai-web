import 'package:get/get.dart';

class ConsoleController extends GetxController {
  bool rightBarOpen = false;
  bool leftBarCondensed = false;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void openRightBar(bool opened) {
    rightBarOpen = opened;
  }

  void toggleLeftBarCondensed() {
    leftBarCondensed = !leftBarCondensed;
  }
}
