import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/app/routes/app_router.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/custom_button.dart';
import 'package:spera_mobile/utils/size_config.dart';

class BloodDonateQrViewBody extends StatelessWidget {
  const BloodDonateQrViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          (screenHeight(context) * 0.15).sh,
          const Icon(
            HugeIcons.strokeRoundedQrCode,
            color: AppColors.accentColor,
            size: 256,
          ),
          (screenHeight(context) * 0.15).sh,
          CustomButton(
            text: 'Camera',
            onTap: () => Get.toNamed(AppRoutes.bloodDonateQrResultViewAuth),
            width: (screenWidth(context) * 0.8),
            height: (screenHeight(context) * 0.07),
          )
        ],
      ),
    ));
  }
}
