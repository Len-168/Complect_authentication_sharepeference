import 'package:demo_logic/ListData/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final lstTopslide = <ProductDetile>[].obs;
  final centerSlider = <ProductDetile>[].obs;
  late TabController tabController;
  var currrentIndex = 0.obs;

  @override
  void onReady() {
    TarbarByindex(0);
    super.onReady();
  }

  void getData() {
    lstData.forEach((element) => lstTopslide.addAll(element.productdeile));
    debugPrint('-----Get Data ------');
  }

  void getIndex() {
    currrentIndex.value = tabController.index;
    TarbarByindex(tabController.index);
    print("-------->> INDEX ${currrentIndex} <<-----------");
  }

  void TarbarByindex(int index) {
    final list = lstData.firstWhere(
      (element) => element.label == lstData[index].type,
    );
    centerSlider.value = list.productdeile;
    print("-------->> TAB ${centerSlider} <<-----------");
  }
}
