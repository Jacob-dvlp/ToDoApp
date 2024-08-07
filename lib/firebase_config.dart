import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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
    apiKey: 'AIzaSyA4Amtz_QekuPsgcgdF3pYQMDESzMRbsaQ',
    appId: '1:674171642789:ios:77907ea2aa642daf7dfe4c',
    messagingSenderId: '674171642789',
    projectId: 'uwipa-eceb0',
    storageBucket: 'uwipa-eceb0.appspot.com',
    iosBundleId: 'com.example.uwipa',
  );
}
