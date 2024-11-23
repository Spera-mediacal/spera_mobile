import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback? onToggleObscureText;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.obscureText = true,
    this.onToggleObscureText,
    this.width,
    this.height, this.keyboardType, this.textInputAction, this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? screenWidth(context) * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: TextFormField(
          style: AppTextStyles.textStyle19,
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
           // floatingLabelBehavior: FloatingLabelBehavior.always, m4 3arf eh lzmtha
            hintText: hintText,
            contentPadding:
                EdgeInsets.symmetric(vertical: height ?? 16, horizontal: 12.0),
            hintStyle: AppTextStyles.textStyle19.copyWith(
              color: AppColors.whiteColor.withOpacity(0.35),
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: AppColors.accentColor,
                  )
                : null,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      !obscureText
                          ? HugeIcons.strokeRoundedViewOff
                          : HugeIcons.strokeRoundedView,
                      color: AppColors.accentColor,
                    ),
                    onPressed: onToggleObscureText,
                  )
                : null,
            filled: true,
            fillColor: AppColors.whiteColor.withOpacity(0.16),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
