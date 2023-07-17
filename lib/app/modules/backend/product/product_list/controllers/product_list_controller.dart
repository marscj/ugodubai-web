import 'package:get/get.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print('onInit ${count.value}');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    print('onReady ${count.value}');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('onClose ${count.value}');
  }

  void increment() => count.value++;
}
