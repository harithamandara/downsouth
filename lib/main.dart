// import 'package:downsouth/login_page.dart';
// ignore: unused_import
import 'package:downsouth/signup_page.dart';
import 'package:downsouth/welcome_page.dart';
// ignore: unused_import
import 'package:downsouth/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
