import 'package:demo_logic/Auth/controller/auth_controller.dart';
import 'package:demo_logic/ListData/controller/detile_controller.dart';
import 'package:demo_logic/ListData/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DetileController());
    Get.put(DetileController());
    Get.put(AuthController());
  }
}
