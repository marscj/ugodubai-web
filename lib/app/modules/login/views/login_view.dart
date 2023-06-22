import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/auth_layout.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Form(
        key: controller.basicValidator.formKey,
        child: [
          FxText.titleLarge(
            "login".tr,
            fontWeight: 700,
          ).center,
          FxSpacing.height(4),
          FxText.bodySmall(
            "provide_account".tr,
            muted: true,
          ).center,
          FxSpacing.height(64),
          TextFormField(
            validator: controller.basicValidator.getValidation('username'),
            controller: controller.basicValidator.getController('username'),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "username".tr,
                labelStyle: FxTextStyle.bodySmall(xMuted: true),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 20,
                ),
                contentPadding: FxSpacing.all(16)),
          ),
          FxSpacing.height(24),
          Obx(
            () => TextFormField(
              validator: controller.basicValidator.getValidation('password'),
              controller: controller.basicValidator.getController('password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.showPassword.value,
              decoration: InputDecoration(
                  labelText: "password".tr,
                  labelStyle: FxTextStyle.bodySmall(xMuted: true),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 20,
                  ),
                  suffixIcon: InkWell(
                    onTap: controller.onChangeShowPassword,
                    child: Icon(
                      controller.showPassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                    ),
                  ),
                  contentPadding: FxSpacing.all(16)),
            ),
          ),
          FxSpacing.height(24),
          [
            TextFormField(
              validator: controller.basicValidator.getValidation('verifyCode'),
              controller: controller.basicValidator.getController('verifyCode'),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "verify_code".tr,
                // hintText: "verify_code".tr,
                labelStyle: FxTextStyle.bodySmall(xMuted: true),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 20,
                ),
                contentPadding: FxSpacing.all(16),
              ),
            ).flex(3),
            Obx(
              () => controller.capthcaData != null
                  ? InkWell(
                      onTap: controller.getCaptcha,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Image.memory(
                          base64Decode(controller.capthcaData ?? ''),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ).flex(2)
          ].row(),
          FxSpacing.height(46),
          FilledButton(
            onPressed: controller.onLogin,
            child: Text(
              'login'.tr,
            ),
          ).center,
          // FxSpacing.height(14),
          // TextButton(
          //   onPressed: controller.goToForgotPassword,
          //   style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 12)),
          //   child: Text(
          //     'forgot_password'.tr,
          //   ),
          // ).center,
          FxSpacing.height(12),
          TextButton(
            onPressed: controller.gotoRegister,
            style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 12)),
            child: Text(
              'i_haven_t_account'.tr,
            ),
          ).center,
        ].col(ca: CrossAxisAlignment.start),
      ).paddingAll(32),
    );
  }
}
