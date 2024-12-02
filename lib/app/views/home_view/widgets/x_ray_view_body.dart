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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'This is an Ai model that predict\nbrain and lung tumor',
                  style: AppTextStyles.textStyle19.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
            Obx(() {
              if (controller.analysisResult != null) {
                return Column(
                  children: [

                    Text(
                      'Analysis Result',
                      style: AppTextStyles.textStyle40.copyWith(
                        color: AppColors.accentColor,
                      ),
                    ),
                    // (screenHeight(context)*0.01).sh,
                    Column(
                      children: [
                        Text(
                          'Prediction: ${controller.analysisResult!['prediction']}',
                          style: AppTextStyles.textStyle24.copyWith(
                            color: controller.analysisResult!['prediction'] ==
                                    'Tumor'
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                        Text(
                          'Confidence: ${(controller.analysisResult!['confidence_score'] * 100).toStringAsFixed(0)}%',
                          style: AppTextStyles.textStyle19.copyWith(
                            color: AppColors.whiteColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Text(
                'AI Tumor Detection',
                style: AppTextStyles.textStyle40.copyWith(
                  color: AppColors.accentColor,
                ),
              );
            }),
            (screenHeight(context) * 0.03).sh,
            GestureDetector(
              onTap: controller.pickImage,
              child: Container(
                width: screenWidth(context) * 0.8,
                height: screenHeight(context) * 0.4,
                margin: EdgeInsets.only(
                  bottom: screenHeight(context) * 0.04,
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
                  text: 'Pick image',
                  onTap: controller.pickImage,
                  width: screenWidth(context) * 0.5,
                  height: screenHeight(context) * 0.06,
                  isEnabled: !controller.isAnalyzing,
                ),
                SizedBox(height: screenHeight(context) * 0.02),
                Obx(
                  () => controller.hasImage
                      ? CustomButton(
                          text: controller.isAnalyzing
                              ? 'Analyzing...'
                              : 'Analyze',
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
      ),
    );
  }
}
