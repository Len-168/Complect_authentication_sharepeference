import 'package:demo_logic/ListData/controller/home_controller.dart';
import 'package:demo_logic/ListData/model/items_model.dart';
import 'package:demo_logic/ListData/view/detile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final HomeController _homeContrlloer = Get.find();

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _homeContrlloer.getData();
    _homeContrlloer.tabController =
        TabController(length: lstData.length, vsync: this);
    _homeContrlloer.tabController.addListener(() {
      _homeContrlloer.getIndex();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: lstData.length,
      child: Scaffold(
        backgroundColor: Color.fromARGB(71, 158, 158, 158),
        appBar: AppBar(
          title: Text("HomeScreen"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(10, 158, 158, 158),
          elevation: 0,
        ),
        body: ListView(
          children: [
            _buidlTopSlider(),
            _buildMenuBar(),
            _buildListMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildListMenu() {
    return Obx(
      () => GridView.builder(
        padding: EdgeInsets.only(left: 15, right: 15),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _homeContrlloer.centerSlider.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final data = _homeContrlloer.centerSlider[index];
          return InkWell(
            onTap: () {
              Get.to(
                () => DetileScreem(
                  detileMovie: data,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    data.image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuBar() {
    return TabBar(
      isScrollable: true,
      controller: _homeContrlloer.tabController,
      labelColor: Colors.grey,
      padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 15,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 4,
            color: Colors.red,
            style: BorderStyle.solid,
          ),
        ),
      ),
      tabs: lstData.map((e) => Text(e.label.toString())).toList(),
    );
  }

  Widget _buidlTopSlider() {
    return SizedBox(
      height: Get.height / 2.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _homeContrlloer.lstTopslide.length,
        itemBuilder: (context, index) {
          final toSlide = _homeContrlloer.lstTopslide[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Container(
              width: Get.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    toSlide.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
