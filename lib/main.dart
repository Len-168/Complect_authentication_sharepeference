import 'package:demo_logic/Auth/view/authScreen/login_Screen.dart';
import 'package:demo_logic/Auth/view/splash_screen.dart';
import 'package:demo_logic/ListData/view/home_screen.dart';
import 'package:demo_logic/binding/getBudinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: '/splas',
      getPages: [
        GetPage(name: '/splas', page: () => SplashScreen()),
        GetPage(name: '/loing', page: () => RegistrationLoginScreen()),
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
      ],
    );
  }
}
