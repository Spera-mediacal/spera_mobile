import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../controllers/bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.icon,
    required this.controller,
    required this.index,
  });

  final IconData icon;
  final BottomNavigationBarController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.currentIndex.value == index;
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor.withOpacity(isSelected ? 0.1 : 0),
        ),
        padding: const EdgeInsets.all(5),
        child: IconButton(
          onPressed: () => controller.changeIndex(newIndex: index),
          // Fixed callback
          icon: HugeIcon(
            icon: icon,
            color: AppColors.whiteColor,
            size: 30,
          ),
        ),
      );
    });
  }
}
