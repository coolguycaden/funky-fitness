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
    apiKey: 'AIzaSyCVmxybSKYHr_6PsJ3j5Xps1Ug4qUg2bww',
    appId: '1:545129720327:web:274d21a3c0a0e3406e18a2',
    messagingSenderId: '545129720327',
    projectId: 'funky-fitness',
    authDomain: 'funky-fitness.firebaseapp.com',
    storageBucket: 'funky-fitness.appspot.com',
    measurementId: 'G-HY1G1QD627',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJHaULWXZoavlrz4xjjWadDk_QV54wBKY',
    appId: '1:545129720327:ios:529786a7bef722966e18a2',
    messagingSenderId: '545129720327',
    projectId: 'funky-fitness',
    storageBucket: 'funky-fitness.appspot.com',
    iosBundleId: 'com.funkyfitness.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJHaULWXZoavlrz4xjjWadDk_QV54wBKY',
    appId: '1:545129720327:ios:529786a7bef722966e18a2',
    messagingSenderId: '545129720327',
    projectId: 'funky-fitness',
    storageBucket: 'funky-fitness.appspot.com',
    iosBundleId: 'com.funkyfitness.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVmxybSKYHr_6PsJ3j5Xps1Ug4qUg2bww',
    appId: '1:545129720327:web:5162a7e66dfeb2096e18a2',
    messagingSenderId: '545129720327',
    projectId: 'funky-fitness',
    authDomain: 'funky-fitness.firebaseapp.com',
    storageBucket: 'funky-fitness.appspot.com',
    measurementId: 'G-D77P7CKN0M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnHC_wXsUPj_NsJU-Y3B54yDTQVyQTBH4',
    appId: '1:545129720327:android:2acdbe7bcf8e1f1d6e18a2',
    messagingSenderId: '545129720327',
    projectId: 'funky-fitness',
    storageBucket: 'funky-fitness.appspot.com',
  );

}