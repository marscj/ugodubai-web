import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  FxFormValidator basicValidator = FxFormValidator();

  final showPassword = false.obs,
      loading = false.obs,
      confirmPassword = false.obs;

  @override
  void onInit() {
    super.onInit();

    basicValidator.addField(
      'password',
      required: true,
      validators: [
        FxLengthValidator(min: 6, max: 10),
      ],
      controller: TextEditingController(),
    );
    basicValidator.addField(
      'confirm_password',
      required: true,
      label: "Confirm password",
      validators: [
        FxLengthValidator(min: 6, max: 10),
      ],
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
    showPassword.value = !showPassword.value;
  }

  void onResetPasswordPassword() {
    confirmPassword.value = !confirmPassword.value;
  }
}
