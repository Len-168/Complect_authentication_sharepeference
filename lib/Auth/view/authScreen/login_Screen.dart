import 'package:demo_logic/Auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationLoginScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  final Remail = TextEditingController();

  final Rpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration and Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: Remail,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {},
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: Rpassword,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {},
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _authController.registerUser(Remail.text, Rpassword.text);
              },
              child: Text('Register'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _authController.loginUser(Remail.text, Rpassword.text);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
