import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/views/blood_donation_view/widgets/scan_code.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_button.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class BloodDonateQrViewBody extends StatefulWidget {
  const BloodDonateQrViewBody({super.key});

  @override
  State<BloodDonateQrViewBody> createState() => _BloodDonateQrViewBodyState();
}

class _BloodDonateQrViewBodyState extends State<BloodDonateQrViewBody> {
  Map<String, dynamic>? scannedData;

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
            scannedData == null
                ? const Icon(
              Icons.qr_code_2,
              color: AppColors.accentColor,
              size: 256,
            )
                : _buildScannedDataCard(),
            (screenHeight(context) * 0.15).sh,
            CustomButton(
              text: 'Scan',
              onTap: () async {
                final result = await Get.to(const ScanCodePage());
                if (result != null && result is Map<String, dynamic>) {
                  setState(() {
                    scannedData = result;
                  });
                }
              },
              width: (screenWidth(context) * 0.8),
              height: (screenHeight(context) * 0.07),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannedDataCard() {
    return Card(
      color: AppColors.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${scannedData!['name']}", style: AppTextStyles.textStyle24),
            const SizedBox(height: 10),
            Text("Admin ID: ${scannedData!['admin_id']}", style: AppTextStyles.textStyle24),
            const SizedBox(height: 10),
            Text("Phone: ${scannedData!['phone']}", style: AppTextStyles.textStyle24),
            const SizedBox(height: 10),
            Text("Location: ${scannedData!['location']}", style: AppTextStyles.textStyle24),
          ],
        ),
      ),
    );
  }
}
