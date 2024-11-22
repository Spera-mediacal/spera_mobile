import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';

class CustomInfoContainer extends StatelessWidget {
  // reusable widget in another view
  const CustomInfoContainer({
    super.key,
    required this.title,
    required this.desc,
    this.price,
    this.iconData,
  });

  final String title;
  final String desc;
  final double? price;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (screenHeight(context)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: (screenHeight(context) * 0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.accentColor,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.bgColor.withOpacity(0.2),
            child: Icon(iconData ?? HugeIcons.strokeRoundedBloodBag),
          ),
          SizedBox(
            width: screenWidth(context) * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.textStyle24.copyWith(
                  color: AppColors.bgColor.withOpacity(0.8),
                ),
              ),
              SizedBox(
                width: screenWidth(context)*0.4,

                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  desc,
                  style: AppTextStyles.textStyle15.copyWith(
                    color: AppColors.bgColor.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          (price == null)
              ? screenWidth(context).sh
              : Text(
                  '${price!.toInt()} LE',
                  style: AppTextStyles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.bgColor,
                  ),
                )
        ],
      ),
    );
  }
}
