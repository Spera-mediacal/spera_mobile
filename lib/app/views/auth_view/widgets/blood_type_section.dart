import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/controllers/setup_account_controller.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class BloodTypeSection extends StatelessWidget {
  BloodTypeSection({super.key});
  final SetupAccountController controller = Get.put(SetupAccountController());

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        (screenHeight(context) * 0.02).sh,
        const Text(
          'Blood Type',
          style: AppTextStyles.textStyle35,
        ),
        (screenHeight(context) * 0.01).sh,
        Row(
          children: [
            _buildBloodTypeButton(context, 'A'),
            _buildBloodTypeButton(context, 'B'),
            _buildBloodTypeButton(context, 'O'),
            _buildBloodTypeButton(context, 'AB'),
            const Spacer(),
            Obx((){
              return Column(
                children: [
                  InkWell(
                    onTap: controller.toggleSign,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: !controller.isPositive.value
                          ? AppColors.accentColor
                          : AppColors.bgColor,
                      child: Icon(
                        Icons.add,
                        color: !controller.isPositive.value
                            ? AppColors.bgColor
                            : AppColors.accentColor,
                      ),
                    ),
                  ),
                  (screenHeight(context) * 0.01).sh,
                  InkWell(
                    onTap: controller.toggleSign,
                    child: CircleAvatar(

                      radius: 15,
                      backgroundColor: controller.isPositive.value
                          ? AppColors.accentColor
                          : AppColors.bgColor,
                      child: Icon(
                        Icons.remove,
                        color: controller.isPositive.value
                            ? AppColors.bgColor
                            : AppColors.accentColor,
                      ),
                    ),
                  ),
                ],
              );
            },),
          ],
        ),
      ],
    );
  }

  Widget _buildBloodTypeButton(BuildContext context, String bloodType) {
    return Obx(
          () => InkWell(
        onTap: () => controller.selectBloodType(bloodType),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          width: screenWidth(context) * 0.12,
          height: screenHeight(context) * 0.06,
          decoration: BoxDecoration(
            color: controller.selectedBloodType.value == bloodType
                ? AppColors.bgColor
                : AppColors.accentColor,
            borderRadius: BorderRadius.circular(18),
            border: controller.selectedBloodType.value == bloodType
                ? Border.all(color: AppColors.accentColor, width: 2)
                : null,
          ),
          child: Text(
            bloodType,
            style: AppTextStyles.textStyle24.copyWith(
                color: controller.selectedBloodType.value == bloodType
                    ? AppColors.accentColor
                    : AppColors.bgColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

}
