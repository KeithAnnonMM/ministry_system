import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ministry_system/screens/dashboard.dart';
import 'package:ministry_system/screens/login_pane.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {'/dashboard': (context) => const Dashboard()},
      debugShowCheckedModeBanner: false,
      home: const LoginPane(),
    );
  }
}
