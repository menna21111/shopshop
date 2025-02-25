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
    apiKey: 'AIzaSyDGJ-urqVZAyyOKBZ_KFYTqKP1ANs-QVDw',
    appId: '1:544267222591:web:d3333302cc2e9313f4828a',
    messagingSenderId: '544267222591',
    projectId: 'shopshop-63bdd',
    authDomain: 'shopshop-63bdd.firebaseapp.com',
    storageBucket: 'shopshop-63bdd.firebasestorage.app',
    measurementId: 'G-S83JT94L0C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_HlV0oDZzfBP-6dQ3ijyC_O4jwEk0syk',
    appId: '1:544267222591:android:205f095e01508e5cf4828a',
    messagingSenderId: '544267222591',
    projectId: 'shopshop-63bdd',
    storageBucket: 'shopshop-63bdd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3OfaW-Q6AVQbpN-jB1F-LpUCaOMWVRxA',
    appId: '1:544267222591:ios:7aac02618e26ddaff4828a',
    messagingSenderId: '544267222591',
    projectId: 'shopshop-63bdd',
    storageBucket: 'shopshop-63bdd.firebasestorage.app',
    iosBundleId: 'com.example.shopshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3OfaW-Q6AVQbpN-jB1F-LpUCaOMWVRxA',
    appId: '1:544267222591:ios:7aac02618e26ddaff4828a',
    messagingSenderId: '544267222591',
    projectId: 'shopshop-63bdd',
    storageBucket: 'shopshop-63bdd.firebasestorage.app',
    iosBundleId: 'com.example.shopshop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGJ-urqVZAyyOKBZ_KFYTqKP1ANs-QVDw',
    appId: '1:544267222591:web:b73dc913d22aad6df4828a',
    messagingSenderId: '544267222591',
    projectId: 'shopshop-63bdd',
    authDomain: 'shopshop-63bdd.firebaseapp.com',
    storageBucket: 'shopshop-63bdd.firebasestorage.app',
    measurementId: 'G-YSXCDNZSGF',
  );
}
