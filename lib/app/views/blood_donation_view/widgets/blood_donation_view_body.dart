import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/donation_controller.dart';
import '../../../services/shared_pref_service/sahred_pref_service.dart';
import 'blood_donation_section.dart';
import '../../../../utils/global_widgets/custom_info_container.dart';

class BloodDonationViewBody extends StatefulWidget {
  const BloodDonationViewBody({super.key});

  @override
  _BloodDonationViewBodyState createState() => _BloodDonationViewBodyState();
}

class _BloodDonationViewBodyState extends State<BloodDonationViewBody> {
  final donationController = Get.put(DonationController());
  String userId = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final id = await SharedPreferencesHelper.getId();
    setState(() {
      userId = id ?? "000000"; // Assign the user ID
      isLoading = false; // Mark loading as complete
    });
    donationController.fetchDonationHistory(userId); // Fetch donation history
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: isLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.accentColor,
            ),
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                child: Text(
                  'bloodDonation'.tr,
                  style: AppTextStyles.textStyle35,
                ),
              ),
              (screenHeight(context) * 0.05).sh,
              const BloodDonationSection(),
              (screenHeight(context) * 0.04).sh,
              Text(
                'donationHistory'.tr,
                style: AppTextStyles.textStyle24.copyWith(
                  color: AppColors.whiteColor.withOpacity(0.6),
                  fontWeight: FontWeight.w300,
                ),
              ),
              Obx(() {
                // Check if donation history is empty
                if (donationController.donationHistory.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        'noDonation'.tr,
                        style: AppTextStyles.textStyle15.copyWith(
                          color: AppColors.whiteColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: donationController.donationHistory.length,
                  itemBuilder: (context, index) {
                    final donation =
                    donationController.donationHistory[index];
                    return CustomInfoContainer(
                      title: '${donation.quantity} Liter',
                      desc: donation.date, // Date of donation
                    );
                  },
                );
              }),
              (screenHeight(context) * 0.1).sh,
            ],
          ),
        ),
      ),
    );
  }
}
