import 'package:ugodubai/app/data/login_model.dart';
import 'package:ugodubai/services/http_service.dart';

import '../captcha_model.dart';

class AuthProvider extends HttpService {
  @override
  void onInit() {
    super.onInit();
  }

  Future<CaptchaRes> getCaptcha() async {
    final response = await get('pub/captcha/get');
    return CaptchaRes.fromJson(response.body);
  }

  Future<LoginRes> login(payload) async {
    final response = await post('system/login/', payload);
    print(response.bodyString);
    return LoginRes.fromJson(response.body);
  }
}
