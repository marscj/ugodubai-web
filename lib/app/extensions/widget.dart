import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ExtensionWidget on Widget {
  Widget container({
    double? w,
    double? h,
    Alignment? alignment,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    double radius = 0.0,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    DecorationImage? image,
    Gradient? gradient,
    BoxShape shape = BoxShape.rectangle,
    List<BoxShadow>? shadow,
    BlendMode? backgroundBlendMode,
    BoxConstraints? constraints,
  }) {
    return Container(
        width: w,
        height: h,
        margin: margin,
        padding: padding,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          border: border,
          color: color,
          image: image,
          boxShadow: shadow,
          borderRadius: border != null
              ? null
              : shape == BoxShape.rectangle
                  ? borderRadius ?? BorderRadius.circular(radius)
                  : null,
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        ),
        child: this);
  }

  Widget loadJson<T>(
          {required String assets, required AsyncWidgetBuilder<T> builder}) =>
      FutureBuilder<T>(
        future:
            rootBundle.loadString(assets).then((value) => jsonDecode(value)),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return builder(context, snapshot);
          }
          return SizedBox.shrink();
        },
      );

  // Widget refresh(
  //   SmartRefreshController controller, {
  //   Widget? header,
  // }) {
  //   return PullToRefresh(
  //     controller: controller,
  //     header: header,
  //     child: this,
  //   );
  // }

  Widget material(
          {double elevation = 0.0,
          Color? color,
          Color? shadowColor,
          Color? surfaceTintColor,
          TextStyle? textStyle,
          BorderRadiusGeometry? borderRadius,
          ShapeBorder? shape,
          double radius = 0.0}) =>
      Material(
        type: MaterialType.card,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        // borderRadius: borderRadius ?? BorderRadius.circular(radius),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
        child: this,
      );

  Widget positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          width: width,
          height: height,
          child: this);

  Widget gesture(GestureTapCallback? onPressed) =>
      GestureDetector(onTap: onPressed, child: this);

  Widget inkWell({GestureTapCallback? onPressed}) =>
      InkWell(onTap: onPressed, child: this);

  Widget get list => SingleChildScrollView(child: this);

  Widget get sliver => SliverToBoxAdapter(child: this);

  Widget get center => Center(child: this);

  Widget get expanded => Expanded(child: this);

  Widget flex(flex, [fit = FlexFit.loose]) =>
      Flexible(flex: flex, fit: fit, child: this);

  Widget align(alignment) => Align(alignment: alignment, child: this);

  Widget fade(value) => AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animate) {
          return FadeTransition(opacity: animate, child: child);
        },
        child: Container(key: ValueKey(value), child: this),
      );

  Widget fadeInRight() => FadeInRight(child: this);

  Widget fadeInLeft() => FadeInLeft(child: this);
}

extension ExtensionContainer on Container {
  Widget height(height) {
    return Container();
  }
}
