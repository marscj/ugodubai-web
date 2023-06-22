import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

class AuthManagementView extends StatelessWidget {
  const AuthManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          delegate: delegate,
          initialRoute: Routes.AUTH,
          anchorRoute: Routes.USER_LIST,
          filterPages: (afterAnchor) => afterAnchor.take(1),
        );
      },
    );
  }
}
