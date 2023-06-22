import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/auth_layout.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AuthLayout(
      child: Obx(
        () => Form(
          key: controller.basicValidator.formKey,
          child: [
            FxText.titleLarge(
              "reset_password".tr,
              fontWeight: 700,
            ).center,
            FxSpacing.height(10),
            FxText.bodySmall(
              "your_password_will_be_reset".tr,
              muted: true,
            ).center,
            FxSpacing.height(45),
            FxText.labelMedium("new_password".tr),
            FxSpacing.height(4),
            TextFormField(
              validator: controller.basicValidator.getValidation('password'),
              controller: controller.basicValidator.getController('password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.showPassword.value,
              decoration: InputDecoration(
                labelText: "new_password".tr,
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
                contentPadding: FxSpacing.all(16),
                isCollapsed: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            FxSpacing.height(15),
            FxText.labelMedium("confirm_password".tr),
            FxSpacing.height(4),
            TextFormField(
              validator:
                  controller.basicValidator.getValidation('confirm_password'),
              controller:
                  controller.basicValidator.getController('confirm_password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.confirmPassword.value,
              decoration: InputDecoration(
                labelText: "confirm_password".tr,
                labelStyle: FxTextStyle.bodySmall(xMuted: true),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 20,
                ),
                suffixIcon: InkWell(
                  onTap: controller.onResetPasswordPassword,
                  child: Icon(
                    controller.confirmPassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                ),
                contentPadding: FxSpacing.all(16),
                isCollapsed: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            FxSpacing.height(25),
            FxButton.rounded(
              onPressed: controller.onLogin,
              elevation: 0,
              padding: FxSpacing.xy(20, 16),
              backgroundColor: colorScheme.primary,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.loading.value
                      ? SizedBox(
                          height: 14,
                          width: 14,
                          child: CircularProgressIndicator(
                            color: colorScheme.onPrimary,
                            strokeWidth: 1.2,
                          ),
                        )
                      : Container(),
                  if (controller.loading.value) FxSpacing.width(16),
                  FxText.bodySmall(
                    'confirm'.tr,
                    color: colorScheme.onPrimary,
                  ),
                ],
              ),
            ).center,
          ].col(ca: CrossAxisAlignment.start),
        ).paddingAll(flexSpacing),
      ),
    );
  }
}
