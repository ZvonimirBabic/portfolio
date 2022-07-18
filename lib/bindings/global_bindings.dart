import 'package:get/get.dart';
import 'package:portfolio/screens/home/home_controller.dart';
import 'package:portfolio/screens/home/widgets/interactive_controller.dart';

import '../services/dio_service.dart';
import '../services/logger_service.dart';
import '../services/storage_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(LoggerService())
      ..put(StorageService())
      ..put(DioService())
      ..put(HomeController())
      ..put(InteractiveController());
  }
}
