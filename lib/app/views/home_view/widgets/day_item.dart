import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.isAvailable,
    required this.day,
  });

  final bool isAvailable;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.09,
      height: screenHeight(context) * 0.07,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isAvailable
            ? AppColors.accentColor
            : AppColors.whiteColor.withOpacity(0.4),
      ),
      child: Column(
        children: [
          (screenHeight(context) * 0.002).sh,
          CircleAvatar(
            radius: screenWidth(context) * 0.04,
            backgroundColor: AppColors.greyColor,
            child: Text(
              day,
              style: AppTextStyles.textStyle15.copyWith(
                color: isAvailable
                    ? AppColors.accentColor
                    : AppColors.whiteColor.withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}