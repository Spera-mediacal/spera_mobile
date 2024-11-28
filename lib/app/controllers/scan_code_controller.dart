import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodeController extends GetxController {
  final MobileScannerController mobileScannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  final RxList<Barcode> barcodes = <Barcode>[].obs;
  final Rx<Uint8List?> scannedImage = Rx<Uint8List?>(null);

  void onBarcodeDetected(BarcodeCapture capture) async {
    if (capture.barcodes.isNotEmpty) {
      barcodes.assignAll(capture.barcodes);
      scannedImage.value = capture.image;

      // Wait for 3 seconds before navigating back
      await Future.delayed(const Duration(seconds: 3));

      // Navigate back with the scanned data
      final rawValue = barcodes.first.rawValue;
      if (rawValue != null) {
        try {
          // Parse the JSON string into a Map
          final Map<String, dynamic> data = jsonDecode(rawValue);
          Get.back(result: data);
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
