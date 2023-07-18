import 'package:get/get.dart';
import 'package:ugodubai/app/data/providers/menu_provider.dart';

class DashboardController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    MenuProvider().getMenus();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
