import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../example_widgets/2fa.dart';
import '../../services/logger_service.dart';

class HomeController extends GetxController {
  /// ------------------------
  /// LOGGER
  /// ------------------------
  final LoggerService logger = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final RxBool _isDarkModeEnabled = false.obs;
  final RxInt _fontSize = 100.obs;
  final RxBool _shouldShowName = false.obs;
  final RxBool _shouldShowJob = false.obs;

  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController(viewportFraction: 1);

  final List<Widget> exampleWidgets = <Widget>[
    TwoFAWidget(),
    TwoFAWidget(),
    TwoFAWidget(),
    TwoFAWidget(),
  ];

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get isDarkModeEnabled => _isDarkModeEnabled.value;
  String get themeName => isDarkModeEnabled ? 'darkTheme' : 'lightTheme';
  int get fontSize => _fontSize.value;
  bool get shouldShowName => _shouldShowName.value;
  bool get shouldShowJob => _shouldShowJob.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set isDarkModeEnabled(bool value) => _isDarkModeEnabled.value = value;
  set fontSize(int value) => _fontSize.value = value;
  set shouldShowName(bool value) => _shouldShowName.value = value;
  set shouldShowJob(bool value) => _shouldShowJob.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> urlLaunch(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      throw 'There was a problem to open the uri: $url';
    }
  }

  void increaseFont() {
    if (fontSize != 150) {
      fontSize += 5;
    }
  }

  void decreaseFont() {
    if (fontSize != 100) {
      fontSize -= 5;
    }
  }
}
