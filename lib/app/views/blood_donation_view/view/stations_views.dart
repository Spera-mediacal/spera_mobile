import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/glow_container.dart';
import '../../../../utils/global_widgets/waves_background.dart';
import '../../../../utils/size_config.dart';
import '../widgets/stations_view_body.dart';

class StationsView extends StatelessWidget {
  const StationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WavesBackground(
        bottomP: screenHeight(context) * 0.6,
        rightP: -screenWidth(context) * 1.5,
        wavesColor: AppColors.whiteColor,
        externalWidget: GlowContainer(
          bottomPosition: -screenHeight(context) * 0.3,
          rightPosition: -screenWidth(context) * 0.9,
          color: AppColors.accentColor.withOpacity(0.2),
        ),
        child: const StationsViewBody(),
      ),
    );
  }
}
