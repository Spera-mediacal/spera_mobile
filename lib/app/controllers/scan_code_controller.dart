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

  void onBarcodeDetected(BarcodeCapture capture) {
    barcodes.assignAll(capture.barcodes);
    scannedImage.value = capture.image;

    if (barcodes.isNotEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text(barcodes.first.rawValue ?? ""),
          content: scannedImage.value != null
              ? Image.memory(scannedImage.value!)
              : const Text("No image available"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void onClose() {
    mobileScannerController.dispose();
    super.onClose();
  }
}
