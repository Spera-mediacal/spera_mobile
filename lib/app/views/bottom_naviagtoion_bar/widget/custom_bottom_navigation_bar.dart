import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../controllers/bottom_navigation_bar_controller.dart';
import 'bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.bottomNavigationBarController,
  });

  final BottomNavigationBarController bottomNavigationBarController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: screenHeight(context) * 0.02),
        width: screenWidth(context) * 0.6,
        height: screenHeight(context) * 0.07,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.accentColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 30,
            )
          ],
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            CustomBottomNavigationBarItem(
              controller: bottomNavigationBarController,
              index: 0,
              icon: HugeIcons.strokeRoundedHome01,
            ),
            CustomBottomNavigationBarItem(
              controller: bottomNavigationBarController,
              index: 1,
              icon: HugeIcons.strokeRoundedBlood,
            ),
            CustomBottomNavigationBarItem(
              controller: bottomNavigationBarController,
              index: 2,
              icon: HugeIcons.strokeRoundedAppleNews,
            ),
            CustomBottomNavigationBarItem(
              controller: bottomNavigationBarController,
              index: 3,
              icon: HugeIcons.strokeRoundedAlarmClock,
            ),
          ],
        ),
      ),
    );
  }
}
