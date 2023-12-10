import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
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
    apiKey: 'AIzaSyAiZ5DpUu42z_7G_FoRiE2kPT7X0eDPsoA',
    appId: '1:137913026723:web:ab5519624ebecde909d716',
    messagingSenderId: '137913026723',
    projectId: 'tastify-9a3d5',
    authDomain: 'tastify-9a3d5.firebaseapp.com',
    storageBucket: 'tastify-9a3d5.appspot.com',
    measurementId: 'G-Y7WXH1PM2N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtc_rRPSzBoAf3fZ4j6xOAu6SkTBXHepA',
    appId: '1:137913026723:android:b0772b7d8961977009d716',
    messagingSenderId: '137913026723',
    projectId: 'tastify-9a3d5',
    storageBucket: 'tastify-9a3d5.appspot.com',
  );
}
