 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
 import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/custom_button.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';

import '../../../controllers/x_ray_controller.dart';

class XRayViewBody extends StatelessWidget {
  XRayViewBody({super.key});

  final XRayController controller = Get.put(XRayController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth(context) * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pick image',
                style: AppTextStyles.textStyle19.copyWith(
                  color: AppColors.whiteColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
          Obx(() {
            return Container(
              width: screenWidth(context) * 0.8,
              height: screenHeight(context) * 0.4,
              margin: EdgeInsets.symmetric(vertical: screenHeight(context) * 0.04),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.accentColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: controller.selectedImage.value != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  controller.selectedImage.value!,
                  fit: BoxFit.cover,
                ),
              )
                  : const HugeIcon(
                size: 40,
                icon: HugeIcons.strokeRoundedAiImage,
                color: AppColors.accentColor,
              ),
            );
          }),
          CustomButton(
            text: 'Camera',
            onTap: controller.pickImageFromCamera,
            width: screenWidth(context) * 0.5,
            height: screenHeight(context) * 0.06,
          ),
          Obx(() {
            return controller.selectedImage.value != null
                ? CustomButton(
              text: 'Analyze',
              onTap: () {
                // Add your analyze logic here
              },
              width: screenWidth(context) * 0.5,
              height: screenHeight(context) * 0.06,
            )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
