import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnylVqPnpb_jgSvOMVNKiULv0OmZX_QXI',
    appId: '1:66875146555:android:db9ca49a86b497afc4371ec',
    messagingSenderId: '66875146555',
    projectId: 'todoapp-8f063',
    authDomain: 'https://todoapp-8f063-default-rtdb.firebaseio.com/',
    storageBucket: 'todoapp-8f063.appspot.com',
    measurementId: 'G-3GFYMMDJKX',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnylVqPnpb_jgSvOMVNKiULv0OmZX_QXI',
    appId: '1:66875146555:ios:0429ff04362516c9c4371e',
    messagingSenderId: '66875146555',
    projectId: 'todoapp-8f063',
    storageBucket: 'todoapp-8f063.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );
}
