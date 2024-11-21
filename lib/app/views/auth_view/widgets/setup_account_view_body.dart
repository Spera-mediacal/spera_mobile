import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/controllers/auth_controller.dart';
import 'package:spera_mobile/app/views/auth_view/widgets/blood_type_section.dart';
import 'package:spera_mobile/app/views/auth_view/widgets/number_picker.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/logo_widget.dart';
import 'package:spera_mobile/utils/text_styles.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../../utils/size_config.dart';

class SetupAccountViewBody extends StatelessWidget {
  SetupAccountViewBody({super.key});

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
              'Setup Your Account',
              style: AppTextStyles.textStyle35.copyWith(
                color: AppColors.accentColor,
              ),
            ),
            BloodTypeSection(),
            (screenHeight(context) * 0.02).sh,
            const NumberPicker(title: 'Weight', maxValue: 123, minValue: 50, iniValue: 85,),
            const NumberPicker(title: 'Height', maxValue: 123, minValue: 50, iniValue: 85,),
            const NumberPicker(title: 'Age', maxValue: 123, minValue: 50, iniValue: 85,),
          ],
        ),
      ),
    );
  }
}
