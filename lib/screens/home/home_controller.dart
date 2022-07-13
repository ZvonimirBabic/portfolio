import 'package:get/get.dart';

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

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get isDarkModeEnabled => _isDarkModeEnabled.value;
  String get themeName => isDarkModeEnabled ? 'darkTheme' : 'lightTheme';
  int get fontSize => _fontSize.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set isDarkModeEnabled(bool value) => _isDarkModeEnabled.value = value;
  set fontSize(int value) => _fontSize.value = value;

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
