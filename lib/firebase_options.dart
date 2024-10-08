// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQKzDufIHNi7_Fx7M7X_TbY9bC93QHnmg',
    appId: '1:309005438799:web:136fdbb03f0bc35291bf3a',
    messagingSenderId: '309005438799',
    projectId: 'plotsklapps-timelapps',
    authDomain: 'plotsklapps-timelapps.firebaseapp.com',
    storageBucket: 'plotsklapps-timelapps.appspot.com',
    measurementId: 'G-8QPVHE233Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3dKdO5JSHFOTwde5MM-rdqq8tVDYaP-s',
    appId: '1:309005438799:android:995688c012b7af5291bf3a',
    messagingSenderId: '309005438799',
    projectId: 'plotsklapps-timelapps',
    storageBucket: 'plotsklapps-timelapps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEzCoQkiv6HPTOUamQnUXuLrUayjyWOuI',
    appId: '1:309005438799:ios:ace96a32f634284b91bf3a',
    messagingSenderId: '309005438799',
    projectId: 'plotsklapps-timelapps',
    storageBucket: 'plotsklapps-timelapps.appspot.com',
    iosClientId: '309005438799-4pvka8t7dopp94beruq8s609icj5gfrp.apps.googleusercontent.com',
    iosBundleId: 'dev.plotsklapps.timelapps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEzCoQkiv6HPTOUamQnUXuLrUayjyWOuI',
    appId: '1:309005438799:ios:ace96a32f634284b91bf3a',
    messagingSenderId: '309005438799',
    projectId: 'plotsklapps-timelapps',
    storageBucket: 'plotsklapps-timelapps.appspot.com',
    iosClientId: '309005438799-4pvka8t7dopp94beruq8s609icj5gfrp.apps.googleusercontent.com',
    iosBundleId: 'dev.plotsklapps.timelapps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcK5ynKo24S6f9gQc43NptiKAIyPWi5Ug',
    appId: '1:309005438799:web:15579f2941a2b8e591bf3a',
    messagingSenderId: '309005438799',
    projectId: 'plotsklapps-timelapps',
    authDomain: 'plotsklapps-timelapps.firebaseapp.com',
    storageBucket: 'plotsklapps-timelapps.appspot.com',
    measurementId: 'G-HTLXY3WGCP',
  );

}