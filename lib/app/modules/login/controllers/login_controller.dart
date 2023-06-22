import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutx/validation/validations.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/data/captcha_model.dart';
import 'package:ugodubai/app/data/providers/auth_provider.dart';
import 'package:ugodubai/app/routes/app_pages.dart';
import 'package:ugodubai/services/auth_service.dart';

class LoginController extends GetxController {
  Rx<CaptchaData?> capthca = Rx<CaptchaData?>(null);
  String? get capthcaData => capthca.value?.data?.img?.substring(22);

  //Variables
  FxFormValidator basicValidator = FxFormValidator();

  final showPassword = false.obs;

  // UI
  void onChangeShowPassword() {
    showPassword.value = !showPassword.value;
    update();
  }

  Future<void> getCaptcha() {
    return AuthProvider().getCaptcha().then((value) {
      capthca.value = value;
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // Services
  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      await AuthService.to.login(basicValidator.getData());
      Get.rootDelegate.offNamed(Get.rootDelegate.currentConfiguration!
              .currentPage!.parameters?['then'] ??
          Routes.HOME);
      // if (errors != null) {
      //   // basicValidator.addErrors(errors);
      //   // basicValidator.validateForm();
      //   // basicValidator.clearErrors();
      // } else {
      //   Get.rootDelegate.offNamed(Get.rootDelegate.currentConfiguration!
      //           .currentPage!.parameters?['then'] ??
      //       Routes.HOME);
      // }
    }
  }

  // Navigation
  void goToForgotPassword() {
    Get.rootDelegate.toNamed(Routes.FORGOT_PASSWORD);
  }

  void gotoRegister() {
    Get.rootDelegate.toNamed(Routes.REGISTER);
  }

  @override
  void onInit() {
    super.onInit();

    basicValidator.addField('username',
        required: true,
        label: "Username",
        validators: [FxEmailValidator()],
        controller: TextEditingController(text: ''));

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [FxLengthValidator(min: 6, max: 10)],
        controller: TextEditingController(text: ''));

    basicValidator.addField('verifyCode',
        required: true,
        label: "VerifyCode",
        validators: [FxLengthValidator(min: 4, max: 4)],
        controller: TextEditingController(text: ''));
  }

  @override
  void onReady() {
    super.onReady();

    getCaptcha();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
