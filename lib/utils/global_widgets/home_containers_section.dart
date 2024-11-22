import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/app/routes/app_router.dart';

import '../colors.dart';
import '../size_config.dart';
import '../../app/views/home_view/widgets/home_container_button.dart';

class HomeContainersSection extends StatelessWidget {
  const HomeContainersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeContainerButton(
          text: 'Check\nYour\nX-Rays',
          width: screenWidth(context) * 0.45,
          height: screenHeight(context) * 0.25,
          onTap: () {},
          color: AppColors.accentColor,
          fontSize: 30,
          iconData: HugeIcons.strokeRoundedPulse01,
        ),
        Column(
          children: [
            HomeContainerButton(
              text: 'Spera Bot',
              width: screenWidth(context) * 0.45,
              height: screenHeight(context) * 0.120,
              onTap: () {
                Get.toNamed(AppRoutes.speraBotViewPath);
              },
              color: AppColors.secAccentColor,
              fontSize: 20,
              iconData: HugeIcons.strokeRoundedChatBot,
            ),
            (screenHeight(context) * 0.01).sh,
            HomeContainerButton(
              text: 'Medicines',
              width: screenWidth(context) * 0.45,
              height: screenHeight(context) * 0.120,
              onTap: () {
                Get.toNamed(AppRoutes.medicinesViewPath);

              },
              color: AppColors.thirdAccentColor,
              fontSize: 20,
              iconData: HugeIcons.strokeRoundedMedicalMask,
            ),
          ],
        )
      ],
    );
  }
}