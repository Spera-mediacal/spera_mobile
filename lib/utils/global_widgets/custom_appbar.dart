import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';

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
        child: Text(
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
