import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/views/home_view/views/home_view.dart';

class BottomNavigationBarController extends GetxController {
  List views = [
    const HomeView(),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
  ];

  var currentIndex = 0.obs;

  void changeIndex({required int newIndex}) {
    currentIndex.value = newIndex;
  }
}