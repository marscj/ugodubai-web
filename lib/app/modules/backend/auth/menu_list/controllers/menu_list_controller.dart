import 'package:get/get.dart';
import 'package:ugodubai/app/data/providers/menu_provider.dart';

class MenuListController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    MenuProvider().getMenus().then((value) {
      print(value);
    });
  }
}
