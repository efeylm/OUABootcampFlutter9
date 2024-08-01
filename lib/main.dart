import 'package:bootcampdeneme/screens/login.dart';
import 'package:bootcampdeneme/screens/onboarding.dart';
import 'package:bootcampdeneme/screens/register.dart';
import 'package:bootcampdeneme/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
