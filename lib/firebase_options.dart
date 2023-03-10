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
    apiKey: 'AIzaSyChGPVPsCIBUdBguPkmJBkQ90eebH1ctbU',
    appId: '1:320451011740:web:9b864dae46abae9f49b959',
    messagingSenderId: '320451011740',
    projectId: 'notes-bloc-ac9f1',
    authDomain: 'notes-bloc-ac9f1.firebaseapp.com',
    storageBucket: 'notes-bloc-ac9f1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzh9wMa7I7AruGVrpYWgEvunRldZfxFao',
    appId: '1:320451011740:android:0a67261beca39f4b49b959',
    messagingSenderId: '320451011740',
    projectId: 'notes-bloc-ac9f1',
    storageBucket: 'notes-bloc-ac9f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEmwtd_lDY3UaPuuO5NTPsqJzAZVuMFgo',
    appId: '1:320451011740:ios:d48c537c79b70d5a49b959',
    messagingSenderId: '320451011740',
    projectId: 'notes-bloc-ac9f1',
    storageBucket: 'notes-bloc-ac9f1.appspot.com',
    iosClientId: '320451011740-7g57ff9f9lf1qas58b8m90kaeasum82n.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEmwtd_lDY3UaPuuO5NTPsqJzAZVuMFgo',
    appId: '1:320451011740:ios:d48c537c79b70d5a49b959',
    messagingSenderId: '320451011740',
    projectId: 'notes-bloc-ac9f1',
    storageBucket: 'notes-bloc-ac9f1.appspot.com',
    iosClientId: '320451011740-7g57ff9f9lf1qas58b8m90kaeasum82n.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesBloc',
  );
}
