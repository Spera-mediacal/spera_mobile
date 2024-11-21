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
  });

  final String text;
  final Color? color;
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size(
            width,
            height,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.accentColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: AppTextStyles.textStyle24.copyWith(
          color: AppColors.bgColor,
        ),
      ),
    );
  }
}
