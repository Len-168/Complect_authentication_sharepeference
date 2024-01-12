import 'package:demo_logic/view/authScreen/login_Screen.dart';
import 'package:demo_logic/view/splash_screen.dart';
import 'package:demo_logic/view/tabScreen/listUser_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Registration and Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splas',
      getPages: [
        GetPage(name: '/splas', page: () => SplashScreen()),
        GetPage(name: '/loing', page: () => RegistrationLoginScreen()),
        GetPage(name: '/showuser', page: () => ShowUser()),
      ],
    );
  }
}
