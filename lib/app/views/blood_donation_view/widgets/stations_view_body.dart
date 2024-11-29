import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../../utils/global_widgets/location_container.dart';
import '../../../../utils/global_widgets/dash_vertical_line.dart';
import '../../../controllers/location_controller.dart';

class StationsViewBody extends StatelessWidget {
  StationsViewBody({super.key});

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Obx(() {
          // Show loading spinner while fetching data
          if (locationController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.accentColor,
              ),
            );
          }

          // Display station data
          return SingleChildScrollView(
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
                        Icons.arrow_back,
                        size: 30,
                        color: AppColors.accentColor,
                      ),
                    ),
                    (screenWidth(context) * 0.15).sw,
                     Text(
                      "Stations".tr,
                      style: AppTextStyles.textStyle40,
                    ),
                  ],
                ),
                Text(
                  'Stationslocation(${locationController.cityName.value})'.tr,
                  style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                (screenHeight(context) * 0.03).sh,
                 ...locationController.stations.map((station) {
                  double distance = locationController.calculateDistance(
                    station.lat,
                    station.lon,
                  );
                  return Column(
                    children: [
                      LocationContainer(
                        address: station.name,
                        distance: '${distance.toStringAsFixed(1)} km', // Distance
                      ),
                      DashedVerticalLine(),
                    ],
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
