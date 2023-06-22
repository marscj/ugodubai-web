import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

class ConsoleView extends StatelessWidget {
  const ConsoleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          delegate: delegate,
          initialRoute: Routes.DASHBOARD,
          anchorRoute: Routes.CONSOLE,
          filterPages: (afterAnchor) => afterAnchor.take(1),
        );
      },
    );
  }
}
