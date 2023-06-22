import 'package:flutter/material.dart';
import 'package:flutx/validation/form_validator.dart';
import 'package:flutx/validation/validators/validators.dart';
import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

class RegisterController extends GetxController {
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

    basicValidator.addField(
      'password',
      required: true,
      validators: [FxLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(),
    );

    basicValidator.addField(
      'confirm_password',
      required: true,
      validators: [FxLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(),
    );
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      // loading = true;
      // update();
      // var errors = await AuthService.loginUser(basicValidator.getData());
      // if (errors != null) {
      //   basicValidator.addErrors(errors);
      //   basicValidator.validateForm();
      //   basicValidator.clearErrors();
      // }
      // FxRouter.pushNamed(context, '/starter');

      // loading = false;
      // update();
    }
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    // update();
  }

  void gotoLogin() {
    Get.rootDelegate.toNamed(Routes.LOGIN);
  }
}
