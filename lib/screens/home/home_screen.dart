import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(),
      );
}
