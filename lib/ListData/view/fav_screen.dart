import 'package:demo_logic/ListData/controller/detile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavScreen extends StatefulWidget {
  FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final DetileController _detileController = Get.find();
  @override
  void initState() {
    _detileController.getFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavScreen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                itemCount: _detileController.lstFavDetile.length,
                itemBuilder: (context, index) {
                  final dataFav = _detileController.lstFavDetile[index];
                  return Container(
                    height: Get.height / 9,
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          dataFav.image,
                        ),
                        Text(
                          "${dataFav.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.amber,
                          ),
                        ),
                        Text("${dataFav.price}")
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
