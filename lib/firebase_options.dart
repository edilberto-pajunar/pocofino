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
    apiKey: 'AIzaSyCMP1UiaDCaNjWDYf4_5_TwHQaG8FW4J-I',
    appId: '1:817457827611:web:03709301bab5490e590dbe',
    messagingSenderId: '817457827611',
    projectId: 'pocofino-38ae0',
    authDomain: 'pocofino-38ae0.firebaseapp.com',
    storageBucket: 'pocofino-38ae0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSYSU2j9scQFCNpJR8OFsBKT6f-mLiEvQ',
    appId: '1:817457827611:android:d66895baf7fc0f0a590dbe',
    messagingSenderId: '817457827611',
    projectId: 'pocofino-38ae0',
    storageBucket: 'pocofino-38ae0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBr10RscmLTvpxNDZFxkGv2lASRBc-21DM',
    appId: '1:817457827611:ios:f08a4cdcdf96c783590dbe',
    messagingSenderId: '817457827611',
    projectId: 'pocofino-38ae0',
    storageBucket: 'pocofino-38ae0.appspot.com',
    iosBundleId: 'com.example.pocofino',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBr10RscmLTvpxNDZFxkGv2lASRBc-21DM',
    appId: '1:817457827611:ios:0e8658dec7452645590dbe',
    messagingSenderId: '817457827611',
    projectId: 'pocofino-38ae0',
    storageBucket: 'pocofino-38ae0.appspot.com',
    iosBundleId: 'com.example.pocofino.RunnerTests',
  );
}
