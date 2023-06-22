import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/auth_layout.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return AuthLayout(
      child: Form(
        key: controller.basicValidator.formKey,
        child: [
          FxText.titleLarge(
            "forgot_password".tr,
            fontWeight: 700,
          ).center,
          FxSpacing.height(10),
          FxText.bodySmall(
            "forgot_password_explain".tr,
            muted: true,
          ).center,
          FxSpacing.height(45),
          FxText.labelMedium("email_address".tr),
          FxSpacing.height(4),
          TextFormField(
            validator: controller.basicValidator.getValidation('email'),
            controller: controller.basicValidator.getController('email'),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "email_address".tr,
              labelStyle: FxTextStyle.bodySmall(xMuted: true),
              prefixIcon: Icon(
                Icons.email_outlined,
                size: 20,
              ),
              contentPadding: FxSpacing.all(16),
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          FxSpacing.height(28),
          FxButton.rounded(
            onPressed: controller.onLogin,
            elevation: 0,
            padding: FxSpacing.xy(20, 16),
            backgroundColor: colorScheme.primary,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.loading
                    ? SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(
                          color: colorScheme.onPrimary,
                          strokeWidth: 1.2,
                        ),
                      )
                    : Container(),
                if (controller.loading) FxSpacing.width(16),
                FxText.bodySmall(
                  'send_email'.tr,
                  color: colorScheme.onPrimary,
                ),
              ],
            ),
          ).center,
          FxButton.text(
            onPressed: controller.gotoLogIn,
            elevation: 0,
            padding: FxSpacing.x(16),
            splashColor: colorScheme.secondary.withOpacity(0.1),
            child: FxText.labelMedium(
              'back_to_log_in'.tr,
              color: colorScheme.secondary,
            ),
          ).center,
        ].col(ca: CrossAxisAlignment.start),
      ).paddingAll(flexSpacing),
    );
  }
}
