import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/glow_background.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';

import '../widgets/spera_bot_view_body.dart';

class SperaBotView extends StatelessWidget {
  const SperaBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: 'Spera Bot',
        onTap: (){},
      ),
      body: GlowBackground(
        firstColor: AppColors.accentColor.withOpacity(0.1),
        bottomPosition: screenHeight(context) * 0.1,
        rightPosition: screenWidth(context) * 0.1,
        child: const SperaBotViewBody(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.03,
        ),
        child:   Text(
          title,
          style: AppTextStyles.textStyle40,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.02,
          left: screenWidth(context) * 0.07,
        ),
        child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            HugeIcons.strokeRoundedArrowLeft01,
            size: 30,
            color: AppColors.accentColor,
          ),
        ),
      ),
    );
  }
}
