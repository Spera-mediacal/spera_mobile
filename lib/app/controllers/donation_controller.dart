import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/constants.dart';
import 'package:spera_mobile/utils/global_widgets/custom_snack_bar.dart';

import '../models/donation_model.dart';
import '../services/shared_pref_service/sahred_pref_service.dart';

class DonationController extends GetxController {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://${Constants.localIP}/api', // Updated base URL
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
  var donationHistory = <DonationModel>[].obs;

  Future<void> addDonation({
    required String userId,
    required int quantity,
    required String date,
  }) async {
    final id = await SharedPreferencesHelper.getId();
    try {
      final response = await dio.post(
        '/donate', // Exact route from curl example
        data: {
          "id": userId,
          "quantity": quantity,
          "date": date,
        },
      );

      if (response.statusCode == 200) {
        fetchDonationHistory(id??'1');
        CustomSnackBar(
          title: 'Success',
          message: response.data['message'],
        ).show();
      } else {
        CustomSnackBar(
          title: 'Error',
          message: response.data['message'] ?? 'Unknown error',
          icon: HugeIcons.strokeRoundedAlert02,
          textColor: AppColors.wrongColor,
        ).show();
      }
    } catch (e) {
      print('Error adding donation: $e');
      CustomSnackBar(
        title: 'Error',
        message: 'Failed to add donation: ${e.toString()}',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
    }
  }

  // Similar updates for fetchDonationHistory method
  Future<void> fetchDonationHistory(String userId) async {
    try {
      final response = await dio.get(
        '/donate/$userId', // Match the exact route pattern
        queryParameters: {
          'id': userId, // Include the query parameter as shown in curl
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['message'] == 'found') {
          donationHistory.clear();
          donationHistory.addAll((data['donate_history'] as List)
              .map((item) => DonationModel.fromJson(item))
              .toList());
        }
      } else {
        CustomSnackBar(
          title: 'Error',
          message: 'Failed to fetch donation history',
          textColor: AppColors.wrongColor,
          icon: HugeIcons.strokeRoundedAlert02,
        ).show();
      }
    } catch (e) {
      print('Error fetching donation history: $e');
      CustomSnackBar(
        title: 'Error',
        message: 'Failed to fetch donation history: ${e.toString()}',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
    }
  }
}