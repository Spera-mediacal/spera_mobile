import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/constants.dart';
import 'package:spera_mobile/utils/global_widgets/custom_snack_bar.dart';

import '../models/donation_model.dart';

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
        CustomSnackBar(
          title: 'Success',
          message: response.data['message'],
        ).show();
      } else {
        CustomSnackBar(
          title: 'Error',
          message: response.data['message'],
          icon: HugeIcons.strokeRoundedAlert02,
          textColor: AppColors.wrongColor,
        ).show();
      }
    } catch (e) {
      CustomSnackBar(
        title: 'Error',
        message: 'Failed to add donation: $e',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
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
        const CustomSnackBar(
          title: 'Error',
          message: 'Failed to fetch donation history',
          textColor: AppColors.wrongColor,
          icon: HugeIcons.strokeRoundedAlert02,
        ).show();
      }
    } catch (e) {
      CustomSnackBar(
        title: 'Error',
        message: 'Failed to fetch donation history: $e',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
    }
  }
}
