import 'package:flutter/material.dart';
import 'package:spera_mobile/utils/global_widgets/waves_background.dart';

import '../../../../utils/colors.dart';
import '../widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WavesBackground(
          wavesColor: AppColors.whiteColor,
          child: OnboardingViewBody(),
        ),
      ),
    );
  }
}
