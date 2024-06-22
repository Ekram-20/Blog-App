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
    apiKey: 'AIzaSyBMAoaLQIUbfoBLvUyi6ReXydt8obkOgX0',
    appId: '1:883519166520:web:f5b4b2e3df23a7f667eecd',
    messagingSenderId: '883519166520',
    projectId: 'blog-app-2d4b3',
    authDomain: 'blog-app-2d4b3.firebaseapp.com',
    storageBucket: 'blog-app-2d4b3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-f2Fn5Np3uR4HtEsoOStzAkKyBdeNp94',
    appId: '1:883519166520:android:cddbe3e2a390907b67eecd',
    messagingSenderId: '883519166520',
    projectId: 'blog-app-2d4b3',
    storageBucket: 'blog-app-2d4b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9BD9ufp8dlstNfmnZFAu1qNPhQWcmNoI',
    appId: '1:883519166520:ios:0b4d68f1c0d3fae067eecd',
    messagingSenderId: '883519166520',
    projectId: 'blog-app-2d4b3',
    storageBucket: 'blog-app-2d4b3.appspot.com',
    iosBundleId: 'com.example.blogApp',
  );
}