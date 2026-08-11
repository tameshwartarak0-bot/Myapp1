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
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'This platform is not supported',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-blc_cnLHRLgY97oD-aQsj2j-Y7v0EdY',
    appId: '1:539912340957:android:42433866cd9193f108a234',
    messagingSenderId: '539912340957',
    projectId: 'yuopni',
    storageBucket: 'yuopni.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-blc_cnLHRLgY97oD-aQsj2j-Y7v0EdY',
    appId: '1:539912340957:web:ecb0dbd123f4c48608a234',
    messagingSenderId: '539912340957',
    projectId: 'yuopni',
    authDomain: 'yuopni.firebaseapp.com',
    storageBucket: 'yuopni.appspot.com',
    measurementId: 'G-5CM0D7SSE8',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-blc_cnLHRLgY97oD-aQsj2j-Y7v0EdY',
    appId: '1:539912340957:ios:xxxxxxxxxxxxxxxx',
    messagingSenderId: '539912340957',
    projectId: 'yuopni',
    storageBucket: 'yuopni.appspot.com',
    iosBundleId: 'com.example.myApp',
  );
}