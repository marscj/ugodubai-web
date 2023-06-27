import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/components/auth_layout.dart';
import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: [
        FxText.titleLarge(
          'register'.tr,
          fontWeight: 700,
        ).center,
        FxSpacing.height(10),
        Center(
            child: FxText.bodySmall(
          'contact_amdin'.tr,
          muted: true,
        )),
        FxSpacing.height(20),
        Container(
          width: double.infinity,
          height: Get.height / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/images/wechat_qr.jpg'),
                  fit: BoxFit.fitHeight)),
        ).center,
        FxSpacing.height(20),
        TextButton(
            onPressed: controller.gotoLogin,
            style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 12)),
            child: Text('already_have_account'.tr)),
      ].col().paddingAll(20),
    );
  }
}

// class RegisterView extends GetView<RegisterController> {
//   const RegisterView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     ColorScheme colorScheme = Theme.of(context).colorScheme;

//     return AuthLayout(
//       child: Form(
//         key: controller.basicValidator.formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//                 child: FxText.titleLarge(
//               "register".tr,
//               fontWeight: 700,
//             )),
//             FxSpacing.height(10),
//             Center(
//                 child: FxText.bodySmall(
//               "create_your_account".tr,
//               muted: true,
//             )),
//             FxSpacing.height(20),
//             FxText.labelMedium(
//               "email_address".tr,
//             ),
//             FxSpacing.height(4),
//             TextFormField(
//               validator: controller.basicValidator.getValidation('email'),
//               controller: controller.basicValidator.getController('email'),
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 labelText: "email_address".tr,
//                 labelStyle: FxTextStyle.bodySmall(xMuted: true),
//                 prefixIcon: Icon(
//                   Icons.email_outlined,
//                   size: 20,
//                 ),
//                 contentPadding: FxSpacing.all(16),
//                 isCollapsed: true,
//                 floatingLabelBehavior: FloatingLabelBehavior.never,
//               ),
//             ),
//             FxSpacing.height(20),
//             FxText.labelMedium(
//               "password".tr,
//             ),
//             FxSpacing.height(4),
//             TextFormField(
//               validator: controller.basicValidator.getValidation('password'),
//               controller:
//                   controller.basicValidator.getController('password1wW'),
//               keyboardType: TextInputType.visiblePassword,
//               obscureText: !controller.showPassword,
//               decoration: InputDecoration(
//                   labelText: "password".tr,
//                   labelStyle: FxTextStyle.bodySmall(xMuted: true),
//                   prefixIcon: Icon(
//                     Icons.lock_outline,
//                     size: 20,
//                   ),
//                   suffixIcon: InkWell(
//                     onTap: controller.onChangeShowPassword,
//                     child: Icon(
//                       controller.showPassword
//                           ? Icons.visibility_outlined
//                           : Icons.visibility_off_outlined,
//                       size: 20,
//                     ),
//                   ),
//                   contentPadding: FxSpacing.all(16),
//                   isCollapsed: true,
//                   floatingLabelBehavior: FloatingLabelBehavior.never),
//             ),
//             FxSpacing.height(20),
//             FxText.labelMedium(
//               "confirm_password".tr,
//             ),
//             FxSpacing.height(4),
//             TextFormField(
//               validator:
//                   controller.basicValidator.getValidation('confirm_password'),
//               controller:
//                   controller.basicValidator.getController('confirm_password'),
//               keyboardType: TextInputType.visiblePassword,
//               obscureText: !controller.showPassword,
//               decoration: InputDecoration(
//                   labelText: "confirm_password".tr,
//                   labelStyle: FxTextStyle.bodySmall(xMuted: true),
//                   prefixIcon: Icon(
//                     Icons.lock_outline,
//                     size: 20,
//                   ),
//                   suffixIcon: InkWell(
//                     onTap: controller.onChangeShowPassword,
//                     child: Icon(
//                       controller.showPassword
//                           ? Icons.visibility_outlined
//                           : Icons.visibility_off_outlined,
//                       size: 20,
//                     ),
//                   ),
//                   contentPadding: FxSpacing.all(16),
//                   isCollapsed: true,
//                   floatingLabelBehavior: FloatingLabelBehavior.never),
//             ),
//             FxSpacing.height(30),
//             FxButton.rounded(
//               onPressed: controller.onLogin,
//               elevation: 0,
//               padding: FxSpacing.xy(20, 16),
//               backgroundColor: colorScheme.primary,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   controller.loading
//                       ? SizedBox(
//                           height: 14,
//                           width: 14,
//                           child: CircularProgressIndicator(
//                             color: colorScheme.onPrimary,
//                             strokeWidth: 1.2,
//                           ),
//                         )
//                       : Container(),
//                   if (controller.loading) FxSpacing.width(16),
//                   FxText.bodySmall(
//                     'register'.tr,
//                     color: colorScheme.onPrimary,
//                   ),
//                 ],
//               ),
//             ).center,
//             FxButton.text(
//               onPressed: controller.gotoLogin,
//               elevation: 0,
//               padding: FxSpacing.x(16),
//               splashColor: colorScheme.secondary.withOpacity(0.1),
//               child: FxText.labelMedium(
//                 'already_have_account'.tr,
//                 color: colorScheme.secondary,
//               ),
//             ).center,
//           ],
//         ),
//       ).paddingAll(flexSpacing),
//     );
//   }
// }
