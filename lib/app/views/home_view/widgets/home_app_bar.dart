import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/routes/app_router.dart';
import 'package:spera_mobile/utils/size_config.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.imageUrl,
    required this.points,
  });

  final String imageUrl;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.profielViewPath);
            },
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/media/avatar.png'),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.profielViewPath);
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 9),
            width: screenWidth(context) * 0.23,
            height: screenHeight(context) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor.withOpacity(0.1),
              border: Border.all(
                color: AppColors.whiteColor.withOpacity(0.1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Constants.coinAssetPath,
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    6.sh,
                    Text(
                      "$points",
                      style: AppTextStyles.textStyle24
                          .copyWith(color: AppColors.accentColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
