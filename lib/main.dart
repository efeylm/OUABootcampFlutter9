import 'package:bootcampdeneme/screens/file_detail.dart';
import 'package:bootcampdeneme/screens/lesson_select.dart';
import 'package:bootcampdeneme/screens/list_file.dart';
import 'package:bootcampdeneme/screens/login.dart';
import 'package:bootcampdeneme/screens/profile.dart';
import 'package:bootcampdeneme/screens/register.dart';
import 'package:bootcampdeneme/screens/home.dart';
import 'package:bootcampdeneme/screens/university_select.dart';
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
