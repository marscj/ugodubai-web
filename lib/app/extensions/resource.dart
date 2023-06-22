import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

extension ExtensionFile on Widget {
  Widget loadJson<T>(
          {required String assets, required AsyncWidgetBuilder<T> builder}) =>
      FutureBuilder<T>(
        future:
            rootBundle.loadString(assets).then((value) => jsonDecode(value)),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SizedBox(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return builder(context, snapshot);
          }
          return SizedBox.shrink();
        },
      );
}
