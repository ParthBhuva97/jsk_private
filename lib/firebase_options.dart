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
    apiKey: 'AIzaSyBfxub90DchjzCe9eZaR8M36-1GJN7UEJM',
    appId: '1:612333560674:web:8663bbd378d3ff5ae5823b',
    messagingSenderId: '612333560674',
    projectId: 'test-46415',
    authDomain: 'test-46415.firebaseapp.com',
    databaseURL: 'https://test-46415-default-rtdb.firebaseio.com',
    storageBucket: 'test-46415.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAkmwguqe5QfFfoq2zGQ0H6wjPGSsXzyo',
    appId: '1:612333560674:android:eb6472c10b24475fe5823b',
    messagingSenderId: '612333560674',
    projectId: 'test-46415',
    databaseURL: 'https://test-46415-default-rtdb.firebaseio.com',
    storageBucket: 'test-46415.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-vDthlAXdBNs5NvseD0q0NMHnktMW4gM',
    appId: '1:612333560674:ios:f66f91cacb1acb95e5823b',
    messagingSenderId: '612333560674',
    projectId: 'test-46415',
    databaseURL: 'https://test-46415-default-rtdb.firebaseio.com',
    storageBucket: 'test-46415.appspot.com',
    iosClientId: '612333560674-qbn16ui3dg04ub4pko7convuajjvgs10.apps.googleusercontent.com',
    iosBundleId: 'com.example.jskApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-vDthlAXdBNs5NvseD0q0NMHnktMW4gM',
    appId: '1:612333560674:ios:f66f91cacb1acb95e5823b',
    messagingSenderId: '612333560674',
    projectId: 'test-46415',
    databaseURL: 'https://test-46415-default-rtdb.firebaseio.com',
    storageBucket: 'test-46415.appspot.com',
    iosClientId: '612333560674-qbn16ui3dg04ub4pko7convuajjvgs10.apps.googleusercontent.com',
    iosBundleId: 'com.example.jskApp',
  );
}
