import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_button.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/scan_code_controller.dart';

class BloodDonateQrViewBody extends StatelessWidget {
  const BloodDonateQrViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                (screenWidth(context) * 0.05).sw,
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: AppColors.accentColor,
                  ),
                ),
                (screenWidth(context) * 0.15).sw,
                const Text(
                  "Donate",
                  style: AppTextStyles.textStyle40,
                ),
              ],
            ),
            (screenHeight(context) * 0.15).sh,
            const Icon(
              Icons.qr_code_2,
              color: AppColors.accentColor,
              size: 256,
            ),
            (screenHeight(context) * 0.15).sh,
            CustomButton(
              text: 'Camera',
              onTap: () => Get.to(ScanCodePage()), // Navigate to scanner
              width: (screenWidth(context) * 0.8),
              height: (screenHeight(context) * 0.07),
            ),
          ],
        ),
      ),
    );
  }
}




class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanCodeController controller = Get.put(ScanCodeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed("/generate");
            },
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller.mobileScannerController,
        onDetect: controller.onBarcodeDetected,
      ),
    );
  }
}
