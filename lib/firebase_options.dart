// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAJz61dRTZRhuOZl6vM5rLjoMroKZgZk5I',
    appId: '1:838637244406:web:773082d3497ddcc36ec1d7',
    messagingSenderId: '838637244406',
    projectId: 'portfolio-7a9b1',
    authDomain: 'portfolio-7a9b1.firebaseapp.com',
    storageBucket: 'portfolio-7a9b1.appspot.com',
    measurementId: 'G-P78JREDZPW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANuofFPTNpMAMzgpNxbR5TXNuy03wiJjg',
    appId: '1:838637244406:android:44c79d5291a448f16ec1d7',
    messagingSenderId: '838637244406',
    projectId: 'portfolio-7a9b1',
    storageBucket: 'portfolio-7a9b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1bsql4csijWWP1OI5OWdkrXaZ5aXmNC8',
    appId: '1:838637244406:ios:b721e14e089593616ec1d7',
    messagingSenderId: '838637244406',
    projectId: 'portfolio-7a9b1',
    storageBucket: 'portfolio-7a9b1.appspot.com',
    iosClientId: '838637244406-l3gpv6nivd31ev9i03bvq38pl141ih53.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio',
  );
}
