import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../routes/app_router.dart';
import '../../home_view/widgets/home_container_button.dart';

class BloodDonationSection extends StatelessWidget {
  const BloodDonationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeContainerButton(
            onTap: () {},
            text: 'Donate',
            fontSize: 18,
            width: screenWidth(context) * 0.45,
            height: screenHeight(context) * 0.120,
            iconData: HugeIcons.strokeRoundedQrCode,
            color: AppColors.secAccentColor),
        HomeContainerButton(
            onTap: () {
              Get.toNamed(AppRoutes.stationsView);
            },
            text: 'Donation Station',
            fontSize: 18,
            width: screenWidth(context) * 0.45,
            height: screenHeight(context) * 0.120,
            iconData: HugeIcons.strokeRoundedLocation01,
            color: AppColors.thirdAccentColor)
      ],
    );
  }
}
