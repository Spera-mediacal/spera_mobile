import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/utils/global_widgets/custom_info_container.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../controllers/pharmacy_controller.dart';

class MedicinesViewBody extends StatelessWidget {
  MedicinesViewBody({super.key});

  final PharmacyController controller = Get.put(PharmacyController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.05,
        vertical: screenHeight(context) * 0.02,
      ),
      child: Column(
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search medicines...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: controller.filterMedicines,
          ),
          const SizedBox(height: 16),
          // Medicines List
          Expanded(
            child: Obx(() {
              if (controller.filteredMedicines.isEmpty) {
                return const Center(child: Text('No medicines found.'));
              }
              return ListView.builder(
                itemCount: controller.filteredMedicines.length,
                itemBuilder: (context, index) {
                  final medicine = controller.filteredMedicines[index];
                  return CustomInfoContainer(
                    title: medicine['name'] as String,
                    desc: medicine['description'] as String,
                    price: toDouble(medicine['price']),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
