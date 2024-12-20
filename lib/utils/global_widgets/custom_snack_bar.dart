import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';

class CustomSnackBar extends StatelessWidget {
  final String title;
  final String message;
  final Color? textColor;
  final double borderRadius;
  final IconData? icon;
  final Duration? duration;

  const CustomSnackBar({
    super.key,
    required this.title,
    required this.message,
    this.textColor,
    this.borderRadius = 15.0,
    this.icon,
    this.duration = const Duration(seconds: 3),
  });

  void show() {
    Get.snackbar(
      title,
      message,
      colorText: textColor ?? AppColors.accentColor,
      borderRadius: borderRadius,
      icon: icon != null
          ? Icon(
              icon,
              color: textColor ?? AppColors.accentColor,
            )
          : HugeIcon(
              icon: HugeIcons.strokeRoundedAbacus,
              color: textColor ?? AppColors.accentColor,
            ),
      duration: duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: show,
      child: Container(),
    );
  }
}
