import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class AlarmContainer extends StatelessWidget {
  const AlarmContainer({super.key, required this.name, required this.details});

  final String name;
  final String details;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 20),
      width: screenWidth(context) * 1,
      height: screenHeight(context) * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.greyColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.whiteColor.withOpacity(0.3),
            child: const Icon(
              HugeIcons.strokeRoundedMedicineBottle01,
              color: AppColors.accentColor,
            ),
          ),
          SizedBox(
            width: screenWidth(context) * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyles.textStyle24,
              ),
              Text(
                details,
                style: AppTextStyles.textStyle15.copyWith(
                  color: AppColors.accentColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){},
            child: const Center(
                child: Icon(
                  HugeIcons.strokeRoundedAlarmClock,
                  size: 32,
                  color: AppColors.accentColor,
                ),
              ),

          ),
        ],
      ),
    );
  }
}
