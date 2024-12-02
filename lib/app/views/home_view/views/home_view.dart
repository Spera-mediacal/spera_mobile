import 'package:flutter/material.dart';
import 'package:spera_mobile/app/views/home_view/widgets/home_view_body.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/glow_container.dart';
import 'package:spera_mobile/utils/global_widgets/waves_background.dart';
import 'package:spera_mobile/utils/size_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WavesBackground(
        bottomP: screenHeight(context) * 0.6,
        rightP: -screenWidth(context) * 1.5,
        wavesColor: AppColors.whiteColor,
        externalWidget: GlowContainer(
          bottomPosition: screenHeight(context) * 0.3,
          rightPosition: -screenWidth(context) * 0.3,
          color: AppColors.accentColor.withOpacity(0.2),
        ),
        child:   HomeViewBody(),
      ),
    );
  }
}
