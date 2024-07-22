import 'package:bootcampdeneme/screens/login.dart';
import 'package:bootcampdeneme/screens/onboarding.dart';
import 'package:bootcampdeneme/screens/register.dart';
import 'package:bootcampdeneme/screens/home.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(), //açılış sayfası
    );
  }
}
