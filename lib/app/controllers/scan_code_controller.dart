import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:spera_mobile/app/controllers/donation_controller.dart';

import '../services/shared_pref_service/sahred_pref_service.dart';

class ScanCodeController extends GetxController {
  final DonationController donationController = Get.put(DonationController());
  final MobileScannerController mobileScannerController =
      MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

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
          donationController.addDonation(
              userId: id ?? '404',
              quantity: 1,
              date: DateTime.now().toString(),
          );
        } catch (e) {
          Get.snackbar("Error", "Invalid QR Code format: ${e.toString()}");
        }
      } else {
        Get.snackbar("Error", "No data found in the QR Code");
      }
    }
  }

  @override
  void onClose() {
    mobileScannerController.dispose();
    super.onClose();
  }
}
