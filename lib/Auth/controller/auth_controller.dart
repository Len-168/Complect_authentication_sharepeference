import 'package:demo_logic/Auth/model/user_model.dart';
import 'package:demo_logic/Auth/repository/local_repo.dart';
import 'package:demo_logic/ListData/view/home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _userRepository = UserRepository.instance;
  final users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    users.value = await _userRepository.getUsers();
  }

  Future<void> registerUser(String email, String password) async {
    final user = User(email: email, password: password);
    await _userRepository.saveUser(user);
    fetchUsers();
    print('---->> Register Success -----');
  }

  void loginUser(String email, String password) async {
    final user = await _userRepository.loginUser(email, password);
    if (user != null) {
      Get.to(() => HomeScreen());
      await _userRepository.putStatusLogin();
    }
  }

  Future<bool> isLogin() async {
    final status = await _userRepository.getStatusLogin();
    print(status);
    return status;
  }
}
