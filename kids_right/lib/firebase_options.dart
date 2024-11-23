// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCZuaKldR-_0nuDohZIH5HA3O3A4L2RsNE',
    appId: '1:625248095479:web:09d1f6a2734fee564217f2',
    messagingSenderId: '625248095479',
    projectId: 'projectexam-c8b36',
    authDomain: 'projectexam-c8b36.firebaseapp.com',
    storageBucket: 'projectexam-c8b36.appspot.com',
    measurementId: 'G-J84HK45VZK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvzzFt8P2NiGGntEBGBKRODTpLcdGOFaY',
    appId: '1:625248095479:android:522e1075d25d4f564217f2',
    messagingSenderId: '625248095479',
    projectId: 'projectexam-c8b36',
    storageBucket: 'projectexam-c8b36.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0XMQRRn2vhY4OfdrVX9g0rYNJtzD41nw',
    appId: '1:625248095479:ios:c2fcf964412ec8ca4217f2',
    messagingSenderId: '625248095479',
    projectId: 'projectexam-c8b36',
    storageBucket: 'projectexam-c8b36.appspot.com',
    iosBundleId: 'com.example.kidsRight',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0XMQRRn2vhY4OfdrVX9g0rYNJtzD41nw',
    appId: '1:625248095479:ios:c2fcf964412ec8ca4217f2',
    messagingSenderId: '625248095479',
    projectId: 'projectexam-c8b36',
    storageBucket: 'projectexam-c8b36.appspot.com',
    iosBundleId: 'com.example.kidsRight',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZuaKldR-_0nuDohZIH5HA3O3A4L2RsNE',
    appId: '1:625248095479:web:a8517014bf0a294b4217f2',
    messagingSenderId: '625248095479',
    projectId: 'projectexam-c8b36',
    authDomain: 'projectexam-c8b36.firebaseapp.com',
    storageBucket: 'projectexam-c8b36.appspot.com',
    measurementId: 'G-NC4G0BV4VV',
  );
}