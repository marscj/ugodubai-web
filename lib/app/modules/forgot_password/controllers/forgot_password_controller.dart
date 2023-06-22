import 'package:flutter/material.dart';
import 'package:flutx/validation/form_validator.dart';
import 'package:flutx/validation/validators/validators.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  FxFormValidator basicValidator = FxFormValidator();
  bool showPassword = false, loading = false;

  @override
  void onInit() {
    super.onInit();

    basicValidator.addField(
      'email',
      required: true,
      label: "Email",
      validators: [FxEmailValidator()],
      controller: TextEditingController(),
    );
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      // loading = true;
      // update();
      // var errors = await AuthService.loginUser(basicValidator.getData());
      // if (errors != null) {
      //   basicValidator.validateForm();
      //   basicValidator.clearErrors();
      // }
      // FxRouter.pushNamed(context, '/auth/reset_password');
      // loading = false;
      // update();
    }
  }

  void gotoLogIn() {
    Get.rootDelegate.toNamed(Routes.LOGIN);
  }
}
