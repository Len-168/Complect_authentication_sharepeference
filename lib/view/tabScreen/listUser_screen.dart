import 'package:demo_logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowUser extends StatelessWidget {
  ShowUser({super.key});

  final AuthController _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Showuser"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.users.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(_controller.users[index].email.toString()),
                      Text(_controller.users[index].password.toString()),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
