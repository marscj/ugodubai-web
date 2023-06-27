import 'package:get/get.dart';
import 'package:ugodubai/app/data/providers/user_provider.dart';

class UserListController extends GetxController {
  //TODO: Implement UserListController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    UserProvider().getUsers();
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
