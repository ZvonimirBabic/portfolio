import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import 'logger_service.dart';

class DioService extends GetxService {
  /// ------------------------
  /// LOGGER
  /// ------------------------

  final LoggerService loggerService = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Dio _dio;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Dio get dio => _dio;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set dio(Dio value) => _dio = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();

    dio = Dio();
    /*
    dio.interceptors.add(
      Get.find<AliceService>().alice.getDioInterceptor(),
    );
    */
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<dynamic> getURL(String url) async {
    try {
      // ignore: always_specify_types
      final Response response = await dio.get(url);
      final dynamic data = response.data;

      loggerService.logger.i(data);
      return data;
    } catch (e) {
      loggerService.logger.e('$url\nGET\n$e');
      return null;
    }
  }
}
