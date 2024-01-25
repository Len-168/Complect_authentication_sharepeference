import 'dart:convert';

import 'package:demo_logic/ListData/model/history_model.dart';
import 'package:demo_logic/ListData/model/items_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemsLocal {
  static ItemsLocal get instance => ItemsLocal._internal();
  ItemsLocal._internal();

  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  Future<bool> setItems(List<ProductDetile> productDetile, String key) async {
    final perf = await _getSharePreference();
    List<String> items =
        productDetile.map((e) => jsonEncode(e.toMap())).toList();
    return perf.setStringList(key, items);
  }

  Future<List<ProductDetile>> getItems(String key) async {
    final perf = await _getSharePreference();
    final items = perf.getStringList(key);
    return items?.map((e) => ProductDetile.fromJson(jsonDecode(e))).toList() ??
        [];
  }

  Future<bool> setItem(ProductDetile productDetile, String key) async {
    final getProductDetile = await getItems(key);
    final isExiting = getProductDetile
        .indexWhere((element) => element.id == productDetile.id);
    if (isExiting == -1) {
      getProductDetile.add(productDetile);
      return await setItems(getProductDetile, key);
    }
    return false;
  }

  Future<bool> removeAllByKey({required String key}) async {
    final pref = await _getSharePreference();
    return pref.remove(key);
  }

  // Repo History

  Future<List<OrderHistory>> getHistoryOrder() async {
    final perf = await _getSharePreference();
    final items = perf.getStringList("History");
    return items?.map((e) => OrderHistory.fromJson(jsonDecode(e))).toList() ??
        [];
  }

  Future<bool> putHisoryOrders(List<OrderHistory> orderHistory) async {
    final perf = await _getSharePreference();
    List<String> items =
        orderHistory.map((e) => jsonEncode(e.toMap())).toList();
    print(items.toString());
    return perf.setStringList("History", items);
  }

  Future<bool> putHistory(OrderHistory orderHistory) async {
    final HistoryOrder = await getHistoryOrder();
    HistoryOrder.add(orderHistory);

    return putHisoryOrders(HistoryOrder);
  }
}
