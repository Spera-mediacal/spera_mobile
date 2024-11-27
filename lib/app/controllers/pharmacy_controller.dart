import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PharmacyController extends GetxController {
  var medicines = <Map<String, dynamic>>[].obs;
  var filteredMedicines = <Map<String, dynamic>>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadMedicines();
  }

   Future<void> loadMedicines() async {
    final jsonString = await rootBundle.loadString('assets/data/pharmacies.json');
    final data = jsonDecode(jsonString) as List<dynamic>;
    medicines.value = data.map((item) => item as Map<String, dynamic>).toList();
    filteredMedicines.value = medicines; // Initialize filtered list
  }

   void filterMedicines(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredMedicines.value = medicines;
    } else {
      filteredMedicines.value = medicines.where((medicine) {
        final name = medicine['name']?.toString().toLowerCase() ?? '';
        final arabic = medicine['arabic']?.toString().toLowerCase() ?? '';
        final company = medicine['company']?.toString().toLowerCase() ?? '';
        return name.contains(query.toLowerCase()) ||
            arabic.contains(query.toLowerCase()) ||
            company.contains(query.toLowerCase());
      }).toList();
    }
  }
}
