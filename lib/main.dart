import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sincapp/pages/loginPage.dart';
import 'package:sincapp/pages/mainPage.dart';
import 'package:sincapp/pages/registerPage.dart';
import 'package:sincapp/pages/postPage.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable preview in production
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        ),
      debugShowCheckedModeBanner: false,
      home: Postpage(),
    );
  }
}