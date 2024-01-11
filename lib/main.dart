// ignore_for_file: override_on_non_overriding_member

import 'package:demo_logic/controller/auth_controller.dart';
import 'package:demo_logic/view/authScreen/login_Screen.dart';
import 'package:demo_logic/view/tabScreen/listUser_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  final AuthController _controller = AuthController();
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Registration and Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute:
          _controller.loginStatus.value == 'logged' ? '/showuser' : '/loing',
      getPages: [
        GetPage(name: '/loing', page: () => RegistrationLoginScreen()),
        GetPage(name: '/showuser', page: () => ShowUser()),
      ],
    );
  }
}
