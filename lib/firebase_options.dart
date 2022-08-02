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
    apiKey: 'AIzaSyAgLQuFmrlzMsUX1VS-PuVs2JkYbwNXkZI',
    appId: '1:731281729322:web:920abb9f1c965cd28c6053',
    messagingSenderId: '731281729322',
    projectId: 'lagosabuja-8c93b',
    authDomain: 'lagosabuja-8c93b.firebaseapp.com',
    storageBucket: 'lagosabuja-8c93b.appspot.com',
    measurementId: 'G-V2SBLKFE05',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAant5Apn7RYQdqrbrbsmdTrPFg1gmNn60',
    appId: '1:731281729322:android:7fe1a5be74a2575f8c6053',
    messagingSenderId: '731281729322',
    projectId: 'lagosabuja-8c93b',
    storageBucket: 'lagosabuja-8c93b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkvO3gyyCHwlhsJ3gba3XWBWghmfkaUp8',
    appId: '1:731281729322:ios:ae892978141e29078c6053',
    messagingSenderId: '731281729322',
    projectId: 'lagosabuja-8c93b',
    storageBucket: 'lagosabuja-8c93b.appspot.com',
    iosClientId:
        '731281729322-7o7e4ld0suscferi5tbt0dse5rdq4o5k.apps.googleusercontent.com',
    iosBundleId: 'com.classima.lagosabuja',
  );
}