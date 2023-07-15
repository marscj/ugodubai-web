import 'package:flutter/material.dart';

import 'package:ugodubai/app/components/layout_tab.dart';
import 'package:ugodubai/app/routes/app_pages.dart';

class ConsoleView extends StatelessWidget {
  const ConsoleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutTab(
        initialRoute: Routes.DASHBOARD, anchorRoute: Routes.CONSOLE);
  }
}
