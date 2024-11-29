import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/views/auth_view/widgets/blood_type_section.dart';
import 'package:spera_mobile/app/views/auth_view/widgets/number_picker.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/custom_button.dart';
import 'package:spera_mobile/utils/global_widgets/logo_widget.dart';
import 'package:spera_mobile/utils/text_styles.dart';
import '../../../../utils/size_config.dart';
import '../../../controllers/setup_account_controller.dart';

class SetupAccountViewBody extends StatelessWidget {
  SetupAccountViewBody({super.key});
  final SetupAccountController controller = Get.put(SetupAccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: screenWidth(context) * 0.08),
        child: Column(
          children: [
            LogoWidget(
                width: screenWidth(context) * 0.1,
                height: screenHeight(context) * 0.05),
            (screenHeight(context) * 0.03).sh,
            Text(
              'setAccount'.tr,
              style: AppTextStyles.textStyle35.copyWith(
                color: AppColors.accentColor,
              ),
            ),
            BloodTypeSection(),
            (screenHeight(context) * 0.02).sh,
      Obx(() => NumberPicker(
        title: 'Weight'.tr,
        maxValue: 199,
        minValue: 30,
        iniValue: controller.selectedWeight.value,
        onChanged: (value) => controller.updateWeight(value),
      )),
      Obx(() => NumberPicker(
        title: 'Height'.tr,
        maxValue: 199,
        minValue: 50,
        iniValue: controller.selectedHeight.value,
        onChanged: (value) => controller.updateHeight(value),
      )),
      Obx(() => NumberPicker(
        title: 'Age'.tr,
        maxValue: 80,
        minValue: 18,
        iniValue: controller.selectedAge.value,
        onChanged: (value) => controller.updateAge(value),
      ),),
        (screenHeight(context) * 0.02).sh,
            CustomButton(
              text: 'finishButton'.tr,
              onTap: () => controller.finishSetup(),
              width: screenWidth(context) * 0.6,
              height: screenHeight(context)*0.08,
            ),
          ],
        ),
      ),
    );
  }
}
