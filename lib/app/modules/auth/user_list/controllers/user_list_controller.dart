import 'package:get/get.dart';
import 'package:ugodubai/app/data/providers/user_provider.dart';
import 'package:ugodubai/app/data/user_model.dart';

class UserListController extends GetxController {
  final _userList = Rx<List<UserList>>([]);
  List<UserList> get userList => this._userList.value;
  set userList(value) => this._userList.value = value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    UserProvider().getUsers().then((value) {
      userList = value.data?.userList ?? [];
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
