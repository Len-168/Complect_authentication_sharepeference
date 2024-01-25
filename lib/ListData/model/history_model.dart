import 'dart:convert';
import 'package:demo_logic/ListData/model/items_model.dart';

class OrderHistory {
  String? OderDate;
  int? ItemCount;
  double? totalAmount;
  List<ProductDetile> items = [];

  OrderHistory(this.OderDate, this.ItemCount, this.totalAmount, this.items);

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    List<ProductDetile> allItems = [];
    if (json['items'] != null) {
      allItems = (json['items'] as List)
          .map((e) => ProductDetile.fromJson(jsonDecode(e)))
          .toList();
    }
    return OrderHistory(
      json['OderDate'],
      json['ItemCount'],
      json['totalAmount'],
      allItems,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OderDate': OderDate,
      'ItemCount': ItemCount,
      'totalAmount': totalAmount,
      'items': items.map((e) => jsonEncode(e.toMap())).toList(),
    };
  }
}
