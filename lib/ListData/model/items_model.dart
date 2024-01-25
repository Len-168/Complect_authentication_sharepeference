class ProductDetile {
  int id = 0;
  String name = "";
  double price = 0.0;
  String image = "";
  int qty;
  ProductDetile(int id, String name, double price, String image, this.qty) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.image = image;
    this.qty = qty;
  }

  factory ProductDetile.fromJson(Map<String, dynamic> json) {
    return ProductDetile(
      json['id'],
      json['name'],
      json['price'],
      json['image'],
      int.parse(json['qty']),
    );
  }
  Map toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'qty': qty.toString(),
    };
  }
}

class ProductTabBar {
  String type = "";
  String label = "";
  List<ProductDetile> productdeile = [];
  ProductTabBar(String type, String label, List<ProductDetile> images) {
    this.type = type;
    this.label = label;
    this.productdeile = images;
  }
}

List<ProductTabBar> lstData = [
  ProductTabBar("Now Playing", "Now Playing", [
    ProductDetile(
      1,
      "Coca",
      3.7,
      "assets/profile/pf1.png",
      1,
    ),
    ProductDetile(
      2,
      "Coca",
      4.7,
      "assets/profile/pf2.png",
      1,
    ),
    ProductDetile(
      3,
      "Coca",
      8.7,
      "assets/profile/pf3.png",
      1,
    ),
    ProductDetile(
      4,
      "Coca",
      34.7,
      "assets/profile/pf4.png",
      1,
    ),
    ProductDetile(
      5,
      "Coca",
      9.7,
      "assets/profile/pf5.png",
      1,
    ),
    ProductDetile(
      6,
      "Coca",
      16.7,
      "assets/profile/pf6.png",
      1,
    ),
    ProductDetile(
      7,
      "Coca",
      5.7,
      "assets/profile/pf7.png",
      1,
    ),
    ProductDetile(
      8,
      "Coca",
      9.7,
      "assets/profile/pf8.png",
      1,
    ),
    ProductDetile(
      9,
      "Coca",
      55.7,
      "assets/profile/pf9.png",
      1,
    ),
  ]),
  ProductTabBar("Populor", "Populor", [
    ProductDetile(
      10,
      "Coca",
      11.7,
      "assets/populor/profile/pf1.PNG",
      1,
    ),
    ProductDetile(
      11,
      "Coca",
      33.7,
      "assets/populor/profile/pf2.PNG",
      1,
    ),
    ProductDetile(
      12,
      "Coca",
      16.7,
      "assets/populor/profile/pf3.PNG",
      1,
    ),
    ProductDetile(
      13,
      "Coca",
      22.7,
      "assets/populor/profile/pf4.PNG",
      1,
    ),
  ]),
];
