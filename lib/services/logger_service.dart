import 'dart:convert';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:logger/logger.dart';


class LoggerService extends GetxService {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Logger _logger;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Logger get logger => _logger;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set logger(Logger value) => _logger = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 3,
        lineLength: 50,
        noBoxingByDefault: true,
      ),
    );
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Verbose log, grey color
  void v(String value) => logger.v(value);

  /// 🐛 Debug log, blue color
  void d(String value) => logger.d(value);

  /// 💡 Info log, light blue color
  void i(String value) => logger.i(value);

  /// ⚠️ Warning log, orange color
  void w(String value) => logger.w(value);

  /// ⛔ Error log, red color
  void e(String value) => logger.e(value);

  /// 👾 What a terrible failure error, purple color
  void wtf(String value) => logger.wtf(value);

  /// Logs JSON responses with proper formatting
  void logJson(String data) {
    final dynamic object = json.decode(data);
    final String prettyString = const JsonEncoder.withIndent('  ').convert(object);
    logger.i(prettyString);
  }
}
