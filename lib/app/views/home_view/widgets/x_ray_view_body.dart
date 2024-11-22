import 'dart:io';
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
          GestureDetector(
            onTap: controller.pickImage,
            child: Container(
              width: screenWidth(context) * 0.8,
              height: screenHeight(context) * 0.4,
              margin: EdgeInsets.symmetric(
                vertical: screenHeight(context) * 0.04,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.accentColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Obx(
                () => controller.hasImage
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          File(controller.imagePath!),
                          fit: BoxFit.cover,
                        ),
                      )
                    : const HugeIcon(
                        size: 40,
                        icon: HugeIcons.strokeRoundedAiImage,
                        color: AppColors.accentColor,
                      ),
              ),
            ),
          ),
          Column(
            children: [
              CustomButton(
                text: 'Camera',
                onTap: controller.pickImage,
                width: screenWidth(context) * 0.5,
                height: screenHeight(context) * 0.06,
                isEnabled: !controller.isAnalyzing, // Disable during analysis
              ),
              SizedBox(height: screenHeight(context) * 0.02),
              Obx(
                () => controller.hasImage
                    ? CustomButton(
                        text:
                            controller.isAnalyzing ? 'Analyzing...' : 'Analyze',
                        onTap: controller.analyzeImage,
                        width: screenWidth(context) * 0.5,
                        height: screenHeight(context) * 0.06,
                        isEnabled: !controller.isAnalyzing,
                      )
                    : const SizedBox.shrink(),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
