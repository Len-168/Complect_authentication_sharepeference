import 'dart:async';

import 'package:demo_logic/Auth/controller/auth_controller.dart';
import 'package:demo_logic/ListData/view/home_screen.dart';
import 'package:get/get.dart';

import '../view/authScreen/login_Screen.dart';

class SplashCcontroller extends GetxController {
  Timer? time;
  void initSpashController() async {
    time = Timer(Duration(seconds: 2), () async {
      AuthController _controller = Get.find();
      final isLogin = await _controller.isLogin();
      isLogin
          ? Get.offAll(() => HomeScreen())
          : Get.to(() => RegistrationLoginScreen());
    });
  }
}
