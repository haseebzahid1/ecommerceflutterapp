import 'package:flutter/material.dart';
import 'package:sign_up_login_form/screen/splash/splash_screen.dart';
import 'package:sign_up_login_form/screen/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: const SplashScreen(),

    );
  }
}


