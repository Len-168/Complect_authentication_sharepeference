import 'package:demo_logic/ListData/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetileOrder extends StatelessWidget {
  DetileOrder({super.key, required this.oder});
  OrderHistory oder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: oder.items.length,
              itemBuilder: (context, index) {
                final allItems = oder.items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width,
                    height: 100,
                    child: Row(
                      children: [Image.asset(allItems.image)],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
