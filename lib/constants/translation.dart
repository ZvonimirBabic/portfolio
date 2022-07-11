import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': <String, String>{
          'helloWorld': 'Hello world!',
          'appName': "Zvonimir Babić's portfolio app",
        },
        'de_DE': <String, String>{
          'helloWorld': 'Hallo Welt!',
          'appName': "Zvonimir Babić's portfolio app",
        },
      };
}
