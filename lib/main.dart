import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sincapp/pages/loginPage.dart';
import 'package:sincapp/pages/mainPage.dart';
import 'package:sincapp/pages/registerPage.dart';
import 'package:sincapp/pages/postPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kReleaseMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCtGN0WUHMTFcxh7H2yQJKyBmWXOSMj0AQ',
        appId: '1:556742296297:web:7d88c5dd611f21d88b6678', // Note: use web app ID here
        messagingSenderId: '556742296297',
        projectId: 'sinc2-12522',
        authDomain: 'sinc2-12522.firebaseapp.com',
        storageBucket: 'sinc2-12522.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCtGN0WUHMTFcxh7H2yQJKyBmWXOSMj0AQ',
        appId: '1:556742296297:ios:7d88c5dd611f21d88b6678',
        messagingSenderId: '556742296297',
        projectId: 'sinc2-12522',
        authDomain: 'sinc2-12522.firebaseapp.com',
        storageBucket: 'sinc2-12522.appspot.com',
      ),
    );
  }
  
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,  // Enable in debug mode only
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}