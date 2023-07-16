import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef ControllerBuilderCallback = GetxController Function();

class GetPageMenu extends GetPage {
  GetPageMenu({
    required String name,
    required GetPageBuilder page,
    this.icon,
    this.hide = false,
    bool? popGesture,
    Map<String, String>? parameters,
    Transition? transition,
    Curve curve = Curves.linear,
    bool? participatesInRootNavigator,
    Alignment? alignment,
    String? title,
    bool maintainState = true,
    bool opaque = true,
    double Function(BuildContext context)? gestureWidth,
    Bindings? binding,
    List<Bindings> bindings = const [],
    CustomTransition? customTransition,
    Duration? transitionDuration,
    bool fullscreenDialog = false,
    bool preventDuplicates = true,
    Object? arguments,
    List<GetPage> children = const <GetPage>[],
    List<GetMiddleware>? middlewares,
    GetPage? unknownRoute,
    bool showCupertinoParallax = true,
  }) : super(
          name: name,
          page: page,
          title: title,
          participatesInRootNavigator: participatesInRootNavigator,
          gestureWidth: gestureWidth,
          maintainState: maintainState,
          curve: curve,
          alignment: alignment,
          parameters: parameters,
          opaque: opaque,
          transitionDuration: transitionDuration,
          popGesture: popGesture,
          binding: binding,
          bindings: bindings,
          transition: transition,
          customTransition: customTransition,
          fullscreenDialog: fullscreenDialog,
          children: children,
          middlewares: middlewares,
          unknownRoute: unknownRoute,
          arguments: arguments,
          showCupertinoParallax: showCupertinoParallax,
          preventDuplicates: preventDuplicates,
        );

  final IconData? icon;
  final bool hide;
}
