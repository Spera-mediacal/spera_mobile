import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/app/views/home_view/widgets/home_container_button.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import 'blood_donation_section.dart';
import '../../../../utils/global_widgets/custom_info_container.dart';

class BloodDonationViewBody extends StatelessWidget {
  const BloodDonationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Blood Donation',
                  style: AppTextStyles.textStyle35,
                ),
              ),
              (screenHeight(context) * 0.05).sh,
              const BloodDonationSection(),
              (screenHeight(context) * 0.04).sh,
              Text(
                'Donation History',
                style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.6),
                    fontWeight: FontWeight.w300),
              ),
              const CustomInfoContainer(
                title: 'Rehab Branch',
                desc: '22/2/2024',
              ),const CustomInfoContainer(
                title: 'Nasr City Branch',
                desc: '22/2/2024',
              ),const CustomInfoContainer(
                title: 'Nasr City Branch',
                desc: '22/2/2024',
              ),const CustomInfoContainer(
                title: 'Nasr City Branch',
                desc: '22/2/2024',
              ),const CustomInfoContainer(
                title: 'Nasr City Branch',
                desc: '22/2/2024',
              ),const CustomInfoContainer(
                title: 'Nasr City Branch',
                desc: '22/2/2024',
              ),const CustomInfoContainer(
                title: 'Nasr City Branch',
                desc: '22/2/2024',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
