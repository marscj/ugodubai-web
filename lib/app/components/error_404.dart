import 'package:flutter/material.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('404')],
      ).center,
    );
  }
}
