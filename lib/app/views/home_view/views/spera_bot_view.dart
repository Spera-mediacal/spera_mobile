import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/glow_background.dart';
import 'package:spera_mobile/utils/size_config.dart';

import '../../../../utils/global_widgets/custom_appbar.dart';
import '../widgets/spera_bot_view_body.dart';

class SperaBotView extends StatelessWidget {
  const SperaBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Spera Bot',
        onTap: () {
          Get.back();
        },
      ),
      body: GlowBackground(
        firstColor: AppColors.accentColor.withOpacity(0.1),
        bottomPosition: screenHeight(context) * 0.1,
        rightPosition: screenWidth(context) * 0.1,
        child:   SperaBotViewBody(),
      ),
    );
  }
}

