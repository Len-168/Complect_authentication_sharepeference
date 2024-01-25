import 'package:demo_logic/ListData/controller/detile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DetileController _detileController = Get.find();
  @override
  void initState() {
    _detileController.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
      ),
      body: _buildBody(),
      floatingActionButton: _buildButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildButtom() {
    return ElevatedButton(
        onPressed: () {
          _detileController.complectOrder();
        },
        child: Text("Complect Order"));
  }

  Widget _buildBody() {
    return Column(
      children: [
        Obx(
          () => Expanded(
            child: ListView.builder(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
              itemCount: _detileController.lstCartDetile.length,
              itemBuilder: (context, index) {
                final cartItems = _detileController.lstCartDetile[index];
                return Container(
                  height: Get.height / 9,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(107, 158, 158, 158),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(cartItems.image),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            cartItems.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Qty : ${cartItems.qty}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Text(
                        "total : ${(cartItems.qty * cartItems.price).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 12, 11, 10),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _detileController.removeCart(cartItems);
                        },
                        icon: Icon(
                          Icons.delete,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
