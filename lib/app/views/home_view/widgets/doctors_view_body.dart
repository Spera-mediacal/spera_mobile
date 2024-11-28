import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/views/home_view/widgets/doctor_item.dart';
import 'package:spera_mobile/utils/size_config.dart';

import '../../../controllers/doctors_controller.dart';
import '../../../models/doctor_model.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorsController controller = Get.put(DoctorsController());

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.05,
        vertical: screenHeight(context) * 0.02,
      ),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }


        if (controller.doctorsList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_search, size: 60, color: Colors.grey[400]),
                const SizedBox(height: 10),
                Text(
                  'No doctors available at the moment.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.doctorsList.length,
          itemBuilder: (context, index) {
            final DoctorModel doctor = controller.doctorsList[index];
            return DoctorItem(
              doctor: doctor,
              isOpenable: true,
            );
          },
        );
      }),
    );
  }
}
