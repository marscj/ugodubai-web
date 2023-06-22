import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart';

extension ExtensionAnimator on Widget {
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
