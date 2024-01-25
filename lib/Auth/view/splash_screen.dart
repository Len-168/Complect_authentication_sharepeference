import 'package:demo_logic/Auth/controller/auth_controller.dart';
import 'package:demo_logic/Auth/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final SplashCcontroller _controller = Get.put(SplashCcontroller());
final AuthController _authController = Get.put(AuthController());

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _controller.initSpashController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [Text("Splash_Screen")],
          ),
        ),
      ),
    );
  }
}
