import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// class ResponsiveValue<T> {
//   final T? mobile;
//   final T? tablet;
//   final T? desktop;
//   final T? watch;

//   ResponsiveValue({this.mobile, this.tablet, this.desktop, this.watch});

//   T? value(screen) => screen.responsiveValue(
//       desktop: desktop, tablet: tablet, mobile: mobile, watch: watch);
// }

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, ResponsiveScreen screen);

class ResponsiveWidget extends GetResponsiveWidget {
  final ResponsiveWidgetBuilder? responsive;

  ResponsiveWidget({Key? key, this.responsive})
      : super(
          key: key,
          settings: ResponsiveScreenSettings(
            desktopChangePoint: 1600,
          ),
        );

  @override
  Widget builder() {
    return responsive != null
        ? responsive!(screen.context, screen)
        : SizedBox.expand();
  }
}
