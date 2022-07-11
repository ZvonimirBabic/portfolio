import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/splash/splash_controller.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  final SplashController splashController = Get.find<SplashController>();

  Responsive({
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  static const int mobileBreakpoint = 850;
  static const int desktopBreakpoint = 1100;

  static final bool isMobile = Get.width < mobileBreakpoint;
  static final bool isTablet =
      Get.width < desktopBreakpoint && Get.width >= mobileBreakpoint;
  static final bool isDesktop = Get.width >= desktopBreakpoint;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= desktopBreakpoint) {
            if (desktop != null) {
              return desktop!;
            }
            if (tablet != null) {
              return tablet!;
            }
            return mobile;
          } else if (constraints.maxWidth >= mobileBreakpoint) {
            if (tablet != null) {
              return tablet!;
            }
            return mobile;
          } else {
            return mobile;
          }
        },
      );
}
