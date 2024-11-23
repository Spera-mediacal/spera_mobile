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

  final List<Map<String, dynamic>> stations = [
    {"name": "Badr City", "lat": 30.134640, "lon": 31.729019},
    {"name": "Nasr City", "lat": 30.016893, "lon": 31.377033},
    {"name": "Alexandria", "lat": 31.165120, "lon": 29.874938},
    {"name": "Suez", "lat": 29.972171, "lon": 32.536963},
    {"name": "Al-Shourok City", "lat": 30.129636, "lon": 31.617834},
    {"name": "Alf-Maskan", "lat": 30.137824, "lon": 31.388967},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Obx(() {
          if (locationController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.accentColor,
              ),
            );
          }

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
                    const Text(
                      "Stations",
                      style: AppTextStyles.textStyle40,
                    ),
                  ],
                ),
                Text(
                  'Your Location is (${locationController.cityName.value})',
                  style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
                (screenHeight(context) * 0.03).sh,
                ...stations.map((station) {
                  double distance = locationController.calculateDistance(
                    station['lat'],
                    station['lon'],
                  );
                  return Column(
                    children: [
                      LocationContainer(
                        address: station['name'],
                        distance: '${distance.toStringAsFixed(1)} km',
                      ),
                      DashedVerticalLine(),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
