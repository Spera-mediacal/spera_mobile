import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/global_widgets/dash_vertical_line.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/location_container.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class StationsViewBody extends StatelessWidget {
  const StationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                (screenWidth(context) * 0.05).sw,
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    HugeIcons.strokeRoundedArrowLeft01,
                    size: 30,
                    color: AppColors.accentColor,
                  ),
                ),
                (screenWidth(context) * 0.15).sw,
                const Text(
                  "Stations",
                  style: AppTextStyles.textStyle40,
                ),
              ],
            ),
            (screenHeight(context) * 0.03).sh,
            const LocationContainer(
              title: 'Giza',
              subTitle: '0104982048',
              colorSubTitle: AppColors.accentColor,
              colorTitle: AppColors.whiteColor,
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            )
          ],
        ),
      ),
    ));
  }
}
