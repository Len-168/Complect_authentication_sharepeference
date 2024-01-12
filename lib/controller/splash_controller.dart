import 'dart:async';

import 'package:demo_logic/controller/auth_controller.dart';
import 'package:demo_logic/view/authScreen/login_Screen.dart';
import 'package:demo_logic/view/tabScreen/listUser_screen.dart';
import 'package:get/get.dart';

class SplashCcontroller extends GetxController {
  Timer? time;
  void initSpashController() async {
    time = Timer(Duration(seconds: 2), () {
      AuthController _controller = Get.put(AuthController());

      _controller.loginStatus.value != ""
          ? Get.to(() => ShowUser())
          : Get.to(() => RegistrationLoginScreen());
    });
  }
}
