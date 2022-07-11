// ignore_for_file: always_specify_types

import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/home/home_binding.dart';
import '../screens/home/home_screen.dart';

final List<GetPage> pages = [
  GetPage(
    name: HomeScreen.routeName,
    page: HomeScreen.new,
    binding: HomeBinding(),
  ),
];
