import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/views/home_view/widgets/x_ray_view_body.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_appbar.dart';
import '../../../../utils/global_widgets/glow_background.dart';
import '../../../../utils/size_config.dart';

class XRayView extends StatelessWidget {
  const XRayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'X-Rays',
        onTap: () {
          Get.back();
        },
      ),
      body: GlowBackground(
        firstColor: AppColors.accentColor.withOpacity(0.1),
        bottomPosition: screenHeight(context) * 0.1,
        rightPosition: screenWidth(context) * 0.1,
        child: XRayViewBody(),
      ),
    );
  }
}
