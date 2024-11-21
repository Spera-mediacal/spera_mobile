import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/controllers/bottom_navigation_bar_controller.dart';

import '../widget/custom_bottom_navigation_bar.dart';

class BottomNavigationBarView extends StatelessWidget {
  BottomNavigationBarView({super.key});

  final BottomNavigationBarController bottomNavigationBarController =
  Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          bottomNavigationBarController
              .views[bottomNavigationBarController.currentIndex.value],
          CustomBottomNavigationBar(bottomNavigationBarController: bottomNavigationBarController)
        ],
      );
    });
  }
}


