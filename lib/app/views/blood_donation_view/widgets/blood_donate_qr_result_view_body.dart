import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/size_config.dart';

import '../../../../utils/text_styles.dart';

class BloodDonateQrResultViewBody extends StatelessWidget {
  const BloodDonateQrResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (screenHeight(context) * 0.1).sh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  HugeIcons.strokeRoundedQrCode,
                  color: AppColors.accentColor,
                  size: 128,
                ),
                Text(
                  'Picked \nSuccessfully',
                  style: AppTextStyles.textStyle35.copyWith(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(vertical: 24),
              width: screenWidth(context) * 0.8,
              height: screenHeight(context) * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.whiteColor.withOpacity(0.1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.whiteColor.withOpacity(0.4),
                    child: const Icon(
                      HugeIcons.strokeRoundedStore03,
                      color: AppColors.accentColor,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'El-Maady',
                    style: AppTextStyles.textStyle27
                        .copyWith(color: AppColors.accentColor),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
