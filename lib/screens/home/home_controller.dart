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

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get isDarkModeEnabled => _isDarkModeEnabled.value;
  String get themeName => isDarkModeEnabled ? 'darkTheme' : 'lightTheme';

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set isDarkModeEnabled(bool value) => _isDarkModeEnabled.value = value;

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

}
