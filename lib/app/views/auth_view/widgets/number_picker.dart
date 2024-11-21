import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class NumberPicker extends StatelessWidget {
  const NumberPicker({super.key, required this.title, required this.maxValue, required this.minValue, required this.iniValue,});

  final String title;
  final int maxValue;
  final int minValue;
  final int iniValue;

  @override
  Widget build(BuildContext context) {
    int resultValue = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
            Text(
            title,
            style: AppTextStyles.textStyle35,
          ),
          SizedBox(
            height: screenHeight(context) * 0.07,
            width: screenWidth(context),
            child: WheelChooser.integer(
              onValueChanged: (s) {
                resultValue = s;
              },
              maxValue: maxValue,
              minValue: minValue,
              initValue: iniValue,
              magnification: 1.5,
              horizontal: true,
              selectTextStyle: AppTextStyles.textStyle19
                  .copyWith(color: AppColors.accentColor),
              unSelectTextStyle: AppTextStyles.textStyle15.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
