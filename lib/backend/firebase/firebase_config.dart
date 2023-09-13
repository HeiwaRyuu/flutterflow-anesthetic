import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCuArepsNRUuS6QDCe2Y6qAX1uIxUSg6Ow",
            authDomain: "anesthetic-74295.firebaseapp.com",
            projectId: "anesthetic-74295",
            storageBucket: "anesthetic-74295.appspot.com",
            messagingSenderId: "343035109055",
            appId: "1:343035109055:web:69ea814b9f9efe1033f00a",
            measurementId: "G-RRNCJGZE41"));
  } else {
    await Firebase.initializeApp();
  }
}
