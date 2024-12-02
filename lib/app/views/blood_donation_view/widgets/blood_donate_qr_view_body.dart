import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/app/views/blood_donation_view/widgets/scan_code.dart';
import 'package:spera_mobile/utils/global_widgets/glass_container.dart';

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
                Text(
                  "qrDonate".tr,
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
              text: 'scanButton'.tr,
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
      child: GlassContainer(
        height: screenHeight(context) * 0.4,
        width: screenWidth(context) * 0.9,
        color: AppColors.whiteColor.withOpacity(0.2),
        verticalPadding: screenWidth(context) * 0.1,
        horizontalPadding: screenWidth(context) * 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDonateDataItem(
              icon: HugeIcons.strokeRoundedStore01,
              label: "${scannedData!['station']}",
            ),
            buildDonateDataItem(
              icon: HugeIcons.strokeRoundedDoctor02,
              label: "${scannedData!['examiner']}",
            ),
            buildDonateDataItem(
              icon: HugeIcons.strokeRoundedBloodType,
              label: "${scannedData!['bloodType']}",
            ),
            buildDonateDataItem(
              icon: HugeIcons.strokeRoundedWeightScale,
              label: "${scannedData!['quantity']}",
            ),
          ],
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Station: ${scannedData!['station']}",
            style: AppTextStyles.textStyle24),
        const SizedBox(height: 10),
        Text("Examiner ID: ${scannedData!['examiner']}",
            style: AppTextStyles.textStyle24),
        const SizedBox(height: 10),
        Text("Blood Type: ${scannedData!['bloodType']}",
            style: AppTextStyles.textStyle24),
        const SizedBox(height: 10),
        Text("Quantity: ${scannedData!['quantity']}",
            style: AppTextStyles.textStyle24),
      ],
    );
  }

  Widget buildDonateDataItem({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.whiteColor.withOpacity(0.3),
            child: Icon(
              icon,
              color: AppColors.accentColor,
            ),
          ),
          Text(
            label,
            style: AppTextStyles.textStyle35
                .copyWith(color: AppColors.accentColor),
          )
        ],
      ),
    );
  }
}
