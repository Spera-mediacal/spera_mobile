import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    required this.width,
    required this.height,
    this.isEnabled = true,
    this.borderRadius,
  });

  final String text;
  final Color? color;
  final Function()? onTap;
  final double width;
  final double height;
  final bool isEnabled;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(width, height),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.accentColor.withOpacity(0.5);
          }
          return color ?? AppColors.accentColor;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 17),
          ),
        ),
      ),
      onPressed: isEnabled ? onTap : null,
      child: Text(
        text,
        style: AppTextStyles.textStyle24.copyWith(
          color: AppColors.bgColor,
        ),
      ),
    );
  }
}
