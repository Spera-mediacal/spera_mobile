import 'package:get/get.dart';
import 'package:spera_mobile/utils/constants.dart';
import '../models/donation_model.dart';
import 'package:dio/dio.dart';

class DonationController extends GetxController {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://${Constants.localIP}/api/user/donate',

      headers: {'accept': 'application/json'},
    ),
  );

   var donationHistory = <DonationModel>[].obs;

   Future<void> addDonation({
    required String userId,
    required int quantity,
    required String date,
  }) async {
    try {
      final response = await dio.post(
        '',
        data: {
          "id": userId,
          "quantity": quantity,
          "date": date,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', response.data['message']);
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add donation: $e');
    }
  }

   Future<void> fetchDonationHistory(String userId) async {
    try {
      final response = await dio.get('/$userId', queryParameters: {
        'id': userId,
      });

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['message'] == 'found') {
          // Clear the current donation history
          donationHistory.clear();

          // Add new donation history from the response
          donationHistory.addAll((data['donate_history'] as List)
              .map((item) => DonationModel.fromJson(item))
              .toList());
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch donation history');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch donation history: $e');
    }
  }
}
