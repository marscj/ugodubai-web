import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutx/flutx.dart';
import 'package:ugodubai/app/extensions/widget.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FxResponsive(builder: (BuildContext context, _, screenMT) {
      return screenMT.isMobile ? mobileScreen(context) : largeScreen(context);
    });
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Center(
              child: Opacity(
                  opacity: 0.8,
                  child: BlurHash(hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I")),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FxFlex(
                wrapAlignment: WrapAlignment.center,
                wrapCrossAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: 0,
                children: [
                  FxFlexItem(
                    sizes: "xxl-3 lg-4 md-6 sm-8",
                    child: FxContainer(
                      paddingAll: 0,
                      color: Theme.of(context).colorScheme.background,
                      child: child ?? SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ).center,
          ],
        ));
  }
}
