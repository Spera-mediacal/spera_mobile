import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    super.key,
    required this.address,
    required this.distance,
    this.colorTitle,
    this.colorSubTitle,
  });

  final String address;
  final String distance;
  final Color? colorTitle;
  final Color? colorSubTitle;

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
                address,
                style: AppTextStyles.textStyle24.copyWith(
                  color: colorTitle ?? AppColors.accentColor,
                ),
              ),
              Text(
                distance,
                style: AppTextStyles.textStyle24.copyWith(
                  color: colorSubTitle ?? AppColors.whiteColor,
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
