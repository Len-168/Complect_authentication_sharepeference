import 'package:demo_logic/ListData/controller/detile_controller.dart';
import 'package:demo_logic/ListData/model/items_model.dart';
import 'package:demo_logic/ListData/view/cart_screen.dart';
import 'package:demo_logic/ListData/view/fav_screen.dart';
import 'package:demo_logic/ListData/view/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetileScreem extends StatefulWidget {
  DetileScreem({super.key, required this.detileMovie});
  final ProductDetile detileMovie;

  @override
  State<DetileScreem> createState() => _DetileScreemState();
}

class _DetileScreemState extends State<DetileScreem> {
  final DetileController _detileController = Get.find();
  void initState() {
    _detileController.initIcons(widget.detileMovie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Detile"), actions: [
        GetBuilder<DetileController>(
          init: _detileController,
          builder: (controller) {
            return IconButton(
              onPressed: () {
                _detileController.addFav(widget.detileMovie);
              },
              icon: _detileController.isActiveIcons
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            );
          },
        ),
      ]),
      body: GetBuilder<DetileController>(
        init: _detileController,
        builder: (controller) {
          return Column(
            children: [
              Container(
                width: Get.width / 2.5,
                height: Get.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('${widget.detileMovie.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                '${widget.detileMovie.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 25,
                ),
              ),
              Text(
                '${widget.detileMovie.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.detileMovie.qty -= 1;
                      _detileController.update();
                    },
                    icon: Icon(
                      Icons.minimize,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "${widget.detileMovie.qty}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.detileMovie.qty += 1;
                      _detileController.update();
                      print(widget.detileMovie.qty);
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _detileController.addCart(widget.detileMovie);
                },
                child: Text("Add To Cart"),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => CartScreen());
                    },
                    child: Text("View Cart"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => HistroyScreen());
                    },
                    child: Text("View History"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => FavScreen());
                    },
                    child: Text("View Favate"),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
