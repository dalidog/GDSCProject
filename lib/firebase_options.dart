// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart

/// // ...
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
    apiKey: 'AIzaSyBqiVn0lrHt1neyaFfSNPteKHQ8wh8uZxY',
    appId: '1:346027423606:web:4e85ed92ac738a0632ec57',
    messagingSenderId: '346027423606',
    projectId: 'gdsc-solutions-challenge',
    authDomain: 'gdsc-solutions-challenge.firebaseapp.com',
    storageBucket: 'gdsc-solutions-challenge.appspot.com',
    measurementId: 'G-E8ZG84NWS8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0PT8w4QN4chwa4yslh3XPzTsQAESpFEU',
    appId: '1:346027423606:android:3b68865bcfeb844532ec57',
    messagingSenderId: '346027423606',
    projectId: 'gdsc-solutions-challenge',
    storageBucket: 'gdsc-solutions-challenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjaXREEefTvfCJTvNcGTYSekc0mix99kQ',
    appId: '1:346027423606:ios:33082311f95fd8c432ec57',
    messagingSenderId: '346027423606',
    projectId: 'gdsc-solutions-challenge',
    storageBucket: 'gdsc-solutions-challenge.appspot.com',
    iosClientId:
        '346027423606-rjlkng9mcd0ue3c8u240ncujannv4d3p.apps.googleusercontent.com',
    iosBundleId: 'com.example.gdscProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjaXREEefTvfCJTvNcGTYSekc0mix99kQ',
    appId: '1:346027423606:ios:33082311f95fd8c432ec57',
    messagingSenderId: '346027423606',
    projectId: 'gdsc-solutions-challenge',
    storageBucket: 'gdsc-solutions-challenge.appspot.com',
    iosClientId:
        '346027423606-rjlkng9mcd0ue3c8u240ncujannv4d3p.apps.googleusercontent.com',
    iosBundleId: 'com.example.gdscProject',
  );
}
