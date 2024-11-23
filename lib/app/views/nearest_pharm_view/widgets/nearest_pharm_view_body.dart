import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/controllers/location_controller.dart';
import 'package:spera_mobile/utils/colors.dart';

import '../../../../utils/global_widgets/dash_vertical_line.dart';
import '../../../../utils/global_widgets/location_container.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class NearestPharmViewBody extends StatelessWidget {
    NearestPharmViewBody({super.key});
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    locationController.getLocation();
    print(locationController.latitude.value);
    print(locationController.longitude.value);
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(
        15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Nearest Pharm.',
              style: AppTextStyles.textStyle35,
            ),
            (screenHeight(context) * 0.04).sh,
            Text(
              'Your Location is (Madinty)',
              style: AppTextStyles.textStyle24.copyWith(
                color: AppColors.whiteColor.withOpacity(0.5),
              ),
            ),
            (screenHeight(context) * 0.02).sh,
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.3',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.3',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.3',
            ),
          ],
        ),
      ),
    ));
  }
}
