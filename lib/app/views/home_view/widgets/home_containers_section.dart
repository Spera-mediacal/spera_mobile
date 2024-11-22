import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import 'home_container_button.dart';

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
              onTap: () {},
              color: AppColors.secAccentColor,
              fontSize: 20,
              iconData: HugeIcons.strokeRoundedChatBot,
            ),
            (screenHeight(context) * 0.01).sh,
            HomeContainerButton(
              text: 'Medicines',
              width: screenWidth(context) * 0.45,
              height: screenHeight(context) * 0.120,
              onTap: () {},
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