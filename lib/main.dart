import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio/screens/home/home_controller.dart';
import 'package:portfolio/screens/home/home_screen.dart';

import 'bindings/global_bindings.dart';
import 'constants/pages.dart';
import 'constants/theme.dart';
import 'constants/translation.dart';
import 'services/logger_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  GlobalBinding().dependencies();

  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  final LoggerService logger = Get.find<LoggerService>();

  PortfolioApp({Key? key}) : super(key: key);

  void loggingWithLogger(String text, {bool isError = false}) =>
      isError ? logger.e(text) : logger.d(text);
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        rebuildFactor: (MediaQueryData newData, MediaQueryData oldData) =>
            false,
        builder: (BuildContext context, Widget? widget) => ThemeProvider(
          initTheme: homeController.isDarkModeEnabled ? darkTheme : lightTheme,
          builder: (BuildContext context, ThemeData darkTheme) =>
              GetMaterialApp(
            theme: homeController.isDarkModeEnabled ? darkTheme : lightTheme,
            title: 'appName'.tr,
            logWriterCallback: loggingWithLogger,
            initialBinding: GlobalBinding(),
            initialRoute: HomeScreen.routeName,
            translations: Translation(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en_US'),
            defaultTransition: Transition.fadeIn,
            getPages: pages,
          ),
        ),
      );
}
