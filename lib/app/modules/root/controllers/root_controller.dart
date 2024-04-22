import 'package:app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  List<Widget> pages = const [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];
  int index = 0;

  onNavTapped(index) {
    this.index = index;
    update();
  }
}
