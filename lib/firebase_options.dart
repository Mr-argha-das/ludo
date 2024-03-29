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
    apiKey: 'AIzaSyA_nwf6DN8a8Qt_uzKQDfoN8FtEzEJ41zU',
    appId: '1:280705585846:web:3f934a2f406bc3faa1cc17',
    messagingSenderId: '280705585846',
    projectId: 'ludo-win-65411',
    authDomain: 'ludo-win-65411.firebaseapp.com',
    storageBucket: 'ludo-win-65411.appspot.com',
    measurementId: 'G-WTPWW5MYC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWLRA-ydyc3-QootAsFhce6APcpwO2pso',
    appId: '1:280705585846:android:08050924622b85c4a1cc17',
    messagingSenderId: '280705585846',
    projectId: 'ludo-win-65411',
    storageBucket: 'ludo-win-65411.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWBB8M7oxrtXAPx4lFXD2pFTJK6Mtl2GY',
    appId: '1:280705585846:ios:eb4f819bc6925e49a1cc17',
    messagingSenderId: '280705585846',
    projectId: 'ludo-win-65411',
    storageBucket: 'ludo-win-65411.appspot.com',
    iosBundleId: 'com.example.ludo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWBB8M7oxrtXAPx4lFXD2pFTJK6Mtl2GY',
    appId: '1:280705585846:ios:5f416ab49a05cfa5a1cc17',
    messagingSenderId: '280705585846',
    projectId: 'ludo-win-65411',
    storageBucket: 'ludo-win-65411.appspot.com',
    iosBundleId: 'com.example.ludo.RunnerTests',
  );
}
