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
          text: 'xRay'.tr,
          width: screenWidth(context) * 0.45,
          height: screenHeight(context) * 0.25,
          onTap: () {
            Get.toNamed(AppRoutes.xRayViewPath);
          },
          color: AppColors.accentColor,
          fontSize: 30,
          iconData: HugeIcons.strokeRoundedPulse01,
        ),
        Column(
          children: [
            HomeContainerButton(
              text: 'chatBot'.tr,
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
              text: 'Medic'.tr,
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