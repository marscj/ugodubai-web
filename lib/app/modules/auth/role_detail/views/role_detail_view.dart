import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';

import 'package:ugodubai/app/extensions/widget.dart';
import 'package:ugodubai/app/extensions/widgets.dart';

import '../controllers/role_detail_controller.dart';

class RoleDetailView extends GetView<RoleDetailController> {
  const RoleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: [
        FxFlex(
          children: [
            FxFlexItem(
              sizes: "xl-3 lg-6 sm-12",
              child: TextFormField(
                decoration: InputDecoration(label: Text('ID')),
              ),
            ),
            FxFlexItem(
              sizes: "xl-3 lg-6 sm-12",
              child: TextFormField(
                decoration: InputDecoration(label: Text('ID')),
              ),
            )
          ],
        )
      ].col().list,
    );
  }
}
