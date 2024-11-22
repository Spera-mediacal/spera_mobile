import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    super.key,
    required this.name,
    required this.number,
    this.colorName,
    this.colorNumber,
  });

  final String name;
  final String number;
  final Color? colorName;
  final Color? colorNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.13,
      width: screenWidth(context) * 1,
      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppTextStyles.textStyle24.copyWith(
                  color: colorName ?? AppColors.accentColor,
                ),
              ),
              Text(
                '$number km',
                style: AppTextStyles.textStyle24.copyWith(
                  color: colorNumber ?? AppColors.whiteColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: screenHeight(context) * 0.13,
            height: screenHeight(context) * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.accentColor,
            ),
            child: const Icon(
              HugeIcons.strokeRoundedMapsLocation01,
              size: 52,
            ),
          )
        ],
      ),
    );
  }
}
