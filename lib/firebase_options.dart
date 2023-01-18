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
        return macos;
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
    apiKey: 'AIzaSyAgFU_HRAB4oRG10wpkWUW2aZ-1x-pfOSw',
    appId: '1:865800578615:web:2b1a50f2466247a57401b2',
    messagingSenderId: '865800578615',
    projectId: 'fir-flutter-c816d',
    authDomain: 'fir-flutter-c816d.firebaseapp.com',
    storageBucket: 'fir-flutter-c816d.appspot.com',
    measurementId: 'G-BRXT44TL1C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCV0BVXtbGJrfL4StToe1oECsNnbDS6nKA',
    appId: '1:865800578615:android:1144c91b89bc958c7401b2',
    messagingSenderId: '865800578615',
    projectId: 'fir-flutter-c816d',
    storageBucket: 'fir-flutter-c816d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC90WH9JrERCm1Q87a_VrnMzPDCA8ZVBUA',
    appId: '1:865800578615:ios:54c01eb977e4c44f7401b2',
    messagingSenderId: '865800578615',
    projectId: 'fir-flutter-c816d',
    storageBucket: 'fir-flutter-c816d.appspot.com',
    iosClientId: '865800578615-7pbeb9mao4ji28eu70s2nfqhptsg3fua.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC90WH9JrERCm1Q87a_VrnMzPDCA8ZVBUA',
    appId: '1:865800578615:ios:54c01eb977e4c44f7401b2',
    messagingSenderId: '865800578615',
    projectId: 'fir-flutter-c816d',
    storageBucket: 'fir-flutter-c816d.appspot.com',
    iosClientId: '865800578615-7pbeb9mao4ji28eu70s2nfqhptsg3fua.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseFlutter',
  );
}
