import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ugodubai/app/data/login_model.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

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

  void setUser(data) {
    user = data;
  }

  void login(data) async {
    setUser(data.userInfo);
    saveToken(data.token);
  }

  void logout() {
    setUser(null);
    removeToken();
    Get.rootDelegate.offNamed(Routes.HOME);
  }
}
