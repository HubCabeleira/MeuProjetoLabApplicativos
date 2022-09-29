import 'package:flutter/material.dart';
import 'package:flutter_application_18/firebase_auth_app_rotes.dart';
import 'package:flutter_application_18/pages/splash_page.dart';

class FirebaseAuthApp extends StatefulWidget {
  const FirebaseAuthApp({Key? key}) : super(key: key);

  @override
  State<FirebaseAuthApp> createState() => _FirebaseAuthAppState();
}

class _FirebaseAuthAppState extends State<FirebaseAuthApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: FirebaseAuthAppRoutes().routes,
    );
  }
}
