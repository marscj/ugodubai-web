import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ugodubai/app/data/user_model.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  GetStorage get storage => GetStorage();

  get token => ''.val('token', defVal: '', getBox: () => storage);

  User? user;

  @override
  void onInit() {
    super.onInit();
  }

  bool isLoggedIn() {
    return getToken().isNotEmpty;
  }

  void saveToken(String val) {
    token.val = val;
  }

  String getToken() {
    return token.val;
  }

  void removeToken() {
    storage.remove('token');
  }

  Future<dynamic?> login(data) async {
    // return AuthProvider().login('username', 'password');
  }

  void logout() {
    removeToken();
  }
}
