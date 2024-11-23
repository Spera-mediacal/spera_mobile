import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/utils/colors.dart';

import '../../../../utils/global_widgets/dash_vertical_line.dart';
import '../../../../utils/global_widgets/location_container.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../../app/controllers/location_controller.dart';

class NearestPharmViewBody extends StatelessWidget {
  NearestPharmViewBody({super.key});

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    locationController.getLocation();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Obx(() {
            // Display CircularProgressIndicator while loading
            if (locationController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.accentColor,
                ),
              );
            }

            // When loading is complete, show the content
            return Column(
              children: [
                const Text(
                  'Nearest Pharm.',
                  style: AppTextStyles.textStyle35,
                ),
                (screenHeight(context) * 0.04).sh,
                Text(
                  'Your Location is (${locationController.cityName.value})',
                  style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                (screenHeight(context) * 0.02).sh,
                const LocationContainer(
                  address: 'El Ezaby',
                  distance: '1.3 km',
                ),
                DashedVerticalLine(),
                const LocationContainer(
                  address: 'El Ezaby',
                  distance: '1.3 km',
                ),
                DashedVerticalLine(),
                const LocationContainer(
                  address: 'El Ezaby',
                  distance: '1.3 km',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
