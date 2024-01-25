import 'package:demo_logic/ListData/controller/detile_controller.dart';
import 'package:demo_logic/ListData/view/view_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistroyScreen extends StatefulWidget {
  HistroyScreen({super.key});

  @override
  State<HistroyScreen> createState() => _HistroyScreenState();
}

class _HistroyScreenState extends State<HistroyScreen> {
  final DetileController _controller = Get.find();

  void initState() {
    _controller.getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("History"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _controller.lstHistory.length,
              itemBuilder: (context, index) {
                final items = _controller.lstHistory[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => DetileOrder(
                            oder: items,
                          ));
                    },
                    child: Container(
                      width: Get.width,
                      height: 100,
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items.OderDate.toString()),
                          Text(items.totalAmount.toString())
                        ],
                      ),
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
