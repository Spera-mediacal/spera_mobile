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
    this.borderRadius, // Add this to handle disabled state
  });

  final String text;
  final Color? color;
  final Function()? onTap; // Make it nullable to handle disabled state
  final double width;
  final double height;
  final bool isEnabled; // Add this to handle disabled state
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
            return AppColors.accentColor.withOpacity(0.5); // Disabled color
          }
          return color ?? AppColors.accentColor; // Normal color
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 17),
          ),
        ),
      ),
      onPressed: isEnabled ? onTap : null, // Use the passed onTap function
      child: Text(
        text,
        style: AppTextStyles.textStyle24.copyWith(
          color: AppColors.bgColor,
        ),
      ),
    );
  }
}
