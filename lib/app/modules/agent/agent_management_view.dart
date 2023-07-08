import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

class AgentManagementView extends StatelessWidget {
  const AgentManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return GetRouterOutlet(
          delegate: delegate,
          initialRoute: Routes.AGENT_LIST,
          anchorRoute: Routes.AGENT,
          filterPages: (afterAnchor) => afterAnchor.take(1),
        );
      },
    );
  }
}
