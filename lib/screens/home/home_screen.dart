import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/responsive.dart';
import 'home_controller.dart';
import 'layouts/home_screen_desktop_layout.dart';
import 'layouts/home_screen_mobile_layout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final HomeController homeController = Get.find<HomeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Responsive(
            mobile: const HomeScreenMobileLayout(),
            desktop: const HomeScreenDesktopLayout(),
          ),
        ),
      );
}
