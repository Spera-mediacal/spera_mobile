import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/doctors_controller.dart';
import '../../../models/doctor_model.dart';
import 'doctor_item.dart';

class DoctorsHomeList extends StatelessWidget {
  const DoctorsHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorsController controller = Get.put(DoctorsController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(
          child: Text(
            controller.errorMessage.value,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        );
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
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.doctorsList.length,
        itemBuilder: (context, index) {
          final DoctorModel doctor = controller.doctorsList[index];
          return DoctorItem(
            isOpenable: false,
            doctor: doctor,
          );
        },
      );
    });
  }
}
