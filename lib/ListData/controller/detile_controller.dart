import 'package:demo_logic/ListData/constant/constant.dart';
import 'package:demo_logic/ListData/model/history_model.dart';
import 'package:demo_logic/ListData/model/items_model.dart';
import 'package:demo_logic/ListData/repository/repo_items.dart';
import 'package:get/get.dart';

class DetileController extends GetxController {
  final Stroage = ItemsLocal.instance;
  final lstCartDetile = <ProductDetile>[].obs;
  final lstFavDetile = <ProductDetile>[].obs;
  final lstHistory = <OrderHistory>[].obs;
  var isActiveIcons = false;

  void addCart(ProductDetile productDetile) async {
    print(productDetile.qty);
    final added = await Stroage.setItem(productDetile, key_cart);
    if (added) {
      print('------>> Added <<------');
    }
  }

  void getCart() async {
    final getAllCart = await Stroage.getItems(key_cart);
    lstCartDetile(getAllCart);
    print("------>> Geted Cart <<------");
  }

  void removeCart(ProductDetile productDetile) async {
    final indexItem =
        lstCartDetile.indexWhere((element) => element.id == productDetile.id);
    lstCartDetile.removeAt(indexItem);
    await Stroage.setItems(lstCartDetile, key_cart);
  }

  ///----------------------------------------------------------------------
  ///
  ///
  void initIcons(ProductDetile productDetile) async {
    final allFav = await Stroage.getItems(key_fav);
    final index =
        allFav.indexWhere((element) => element.id == productDetile.id) != -1;

    isActiveIcons = index;
    update();
  }

  void addFav(ProductDetile productDetile) async {
    final getAllItems = await Stroage.getItems(key_fav);
    final isExiting =
        getAllItems.indexWhere((element) => element.id == productDetile.id);
    if (isExiting != -1) {
      removeFav(productDetile);
      isActiveIcons = false;
      update();
      print('-->> DeleteFav <<---');
    } else {
      final isSave = await Stroage.setItem(productDetile, key_fav);
      if (isSave) {
        isActiveIcons = isSave;
        update();
      }
      print('----->> AddFav <<-----');
    }
  }

  void getFav() async {
    final getAllFav = await Stroage.getItems(key_fav);
    lstFavDetile(getAllFav);
    print('---->> Get Fav <<-----');
  }

  void removeFav(ProductDetile productDetile) async {
    final allFav = await Stroage.getItems(key_fav);
    final indexItem =
        allFav.indexWhere((element) => element.id == productDetile.id);
    if (indexItem != -1) {
      allFav.removeAt(indexItem);
      await Stroage.setItems(allFav, key_fav);
    }
  }

  //// ------ History ----------

  void complectOrder() async {
    var OrderDate = DateTime.now().toString();
    var ItemCount = lstCartDetile.length;
    double totalAmount = 0.0;
    lstCartDetile.forEach((element) {
      totalAmount += (element.price) * element.qty;
    });

    final OrderHistory order =
        OrderHistory(OrderDate, ItemCount, totalAmount, lstCartDetile);
    await Stroage.putHistory(order);
    await Stroage.removeAllByKey(key: key_cart);
    lstCartDetile.clear();
  }

  void getHistory() async {
    var allHistory = await Stroage.getHistoryOrder();
    lstHistory(allHistory);
  }
}
