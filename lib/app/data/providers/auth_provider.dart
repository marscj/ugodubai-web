import 'package:ugodubai/services/http_service.dart';

import '../captcha_model.dart';

class AuthProvider extends HttpService {
  @override
  void onInit() {
    super.onInit();
  }

  Future<CaptchaData> getCaptcha() async {
    final response = await get('pub/captcha/get');
    return CaptchaData.fromJson(response.body);
  }
}
