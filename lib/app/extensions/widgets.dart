import 'package:flutter/material.dart';

extension ExtensionListWidget on List<Widget> {
  Iterable<Widget> divider(
      {BuildContext? context, Color? color, Border? border}) {
    assert(color != null || context != null);

    if (isEmpty || length == 1) {
      return this;
    }

    Widget wrapTile(Widget child) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: border ??
              Border(
                right: Divider.createBorderSide(context, color: color),
              ),
        ),
        child: child,
      );
    }

    return <Widget>[
      ...take(length - 1).map(wrapTile),
      last,
    ];
  }

  Widget row({MainAxisAlignment? ma, CrossAxisAlignment? ca}) => Row(
        mainAxisAlignment: ma ?? MainAxisAlignment.start,
        crossAxisAlignment: ca ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: this,
      );

  Widget col({MainAxisAlignment? ma, CrossAxisAlignment? ca}) => Column(
        mainAxisAlignment: ma ?? MainAxisAlignment.start,
        crossAxisAlignment: ca ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: this,
      );

  Widget stack({StackFit fit = StackFit.loose}) =>
      Stack(fit: fit, children: this);

  Widget warp({mainAxisSpacing, crossAxisSpacing}) => Wrap(children: this);

  Widget flex() => Flex(direction: Axis.horizontal, children: this);
}
