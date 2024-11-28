import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../utils/colors.dart';
import '../../../controllers/scan_code_controller.dart';

class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanCodeController controller = Get.put(ScanCodeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.accentColor,
          ),
        ),
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: AppColors.accentColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller.mobileScannerController,
            onDetect: controller.onBarcodeDetected,
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.accentColor,
                  width: 2,
                ),
                color: Colors.transparent,
              ),
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Text(
              "Align the QR code within the box",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
