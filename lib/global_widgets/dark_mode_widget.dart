import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/home/home_controller.dart';

import '../../../constants/theme.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => ThemeSwitcher(
        builder: (BuildContext context) => Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: DayNightSwitcher(
              onLongPress: () {},
              isDarkModeEnabled: homeController.isDarkModeEnabled,
              onStateChanged: (bool isDarkModeEnabled) async {
                homeController.isDarkModeEnabled = isDarkModeEnabled;
                // ignore: always_specify_types
                ThemeSwitcher.of(context).changeTheme(
                    theme: ThemeModelInheritedNotifier.of(context)
                                .theme
                                .brightness ==
                            Brightness.light
                        ? darkTheme
                        : lightTheme);
                Get.back();
              },
            ),
          ),
        ),
      );
}
