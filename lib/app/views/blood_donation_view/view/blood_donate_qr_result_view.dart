import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_appbar.dart';
import '../../../../utils/global_widgets/glow_container.dart';
import '../../../../utils/global_widgets/waves_background.dart';
import '../../../../utils/size_config.dart';
import '../widgets/blood_donate_qr_result_view_body.dart';

class BloodDonateQrResultView extends StatelessWidget {
  const BloodDonateQrResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Donate',
        onTap: () {
          Get.back();
        },
      ),
      body: WavesBackground(
        bottomP: screenHeight(context) * 0.6,
        rightP: -screenWidth(context) * 1.5,
        wavesColor: AppColors.whiteColor,
        externalWidget: GlowContainer(
          bottomPosition: -screenHeight(context) * 0.3,
          rightPosition: -screenWidth(context) * 0.9,
          color: AppColors.accentColor.withOpacity(0.2),
        ),
        child: const BloodDonateQrResultViewBody(),
      ),
    );
  }
}
