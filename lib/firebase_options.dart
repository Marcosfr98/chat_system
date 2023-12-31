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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEA_L-QNiFtrT_HVTeTk74M0o718J7zuA',
    appId: '1:635906574217:android:21aae1ecaa003d2ca54358',
    messagingSenderId: '635906574217',
    projectId: 'chat-system-439e2',
    databaseURL: 'https://chat-system-439e2-default-rtdb.firebaseio.com',
    storageBucket: 'chat-system-439e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVuaQLjDg9vbzOjU89t5Lkxb_oGUFhJvo',
    appId: '1:635906574217:ios:c174f76aa02a22d2a54358',
    messagingSenderId: '635906574217',
    projectId: 'chat-system-439e2',
    databaseURL: 'https://chat-system-439e2-default-rtdb.firebaseio.com',
    storageBucket: 'chat-system-439e2.appspot.com',
    iosBundleId: 'com.restinga.ifrs.chat.br.chatSystem',
  );
}
