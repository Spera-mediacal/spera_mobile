import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:spera_mobile/app/controllers/auth_controller.dart';
import 'package:spera_mobile/app/controllers/donation_controller.dart';
import 'package:spera_mobile/utils/global_widgets/custom_snack_bar.dart';

import '../services/shared_pref_service/sahred_pref_service.dart';

class ScanCodeController extends GetxController {
  final DonationController donationController = Get.put(DonationController());
  final MobileScannerController mobileScannerController =
      MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );
  final AuthController authController = Get.put(AuthController());

  final RxList<Barcode> barcodes = <Barcode>[].obs;
  final Rx<Uint8List?> scannedImage = Rx<Uint8List?>(null);

  void onBarcodeDetected(BarcodeCapture capture) async {
    final id = await SharedPreferencesHelper.getId();
    if (capture.barcodes.isNotEmpty) {
      barcodes.assignAll(capture.barcodes);
      scannedImage.value = capture.image;

      await Future.delayed(const Duration(seconds: 3));

      final rawValue = barcodes.first.rawValue;
      if (rawValue != null) {
        try {
          final Map<String, dynamic> data = jsonDecode(rawValue);
          Get.back(result: data);
          print('======================================================');
          print('id from shared pref. $id');
          print('id from supabase controller. ${authController.userID.value}');
          donationController.addDonation(
            userId: id ?? '1',
            quantity: 1,
            date: DateTime.now().toString(),
          );
        } catch (e) {
          CustomSnackBar(
            title: 'Error',
            message: 'Invalid QR Code format: ${e.toString()}',
            icon: HugeIcons.strokeRoundedAlert02,

          ).show();
        }
      } else {
        const CustomSnackBar(
          title: 'Error',
          message: 'No data found in the QR Code',
          icon: HugeIcons.strokeRoundedAlert02,
        ).show();
      }
    }
  }

  @override
  void onClose() {
    mobileScannerController.dispose();
    super.onClose();
  }
}
