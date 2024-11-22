import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';

class HomeContainerButton extends StatelessWidget { // reusable widget in another view
  const HomeContainerButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    required this.height,
    required this.width,
    required this.iconData,
    required this.color,
  });

  final Function() onTap;
  final String text;
  final double fontSize;
  final double height;
  final double width;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 25, 15),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.bgColor.withOpacity(0.2),
                  child: HugeIcon(
                    icon: iconData,
                    color: AppColors.bgColor,
                    size: 35,
                  ),
                ),
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowUpRight01,
                  color: AppColors.bgColor,
                  size: 35,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  textAlign: TextAlign.start,
                  text,
                  style: AppTextStyles.textStyle24.copyWith(
                    fontSize: fontSize,
                    color: AppColors.bgColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}