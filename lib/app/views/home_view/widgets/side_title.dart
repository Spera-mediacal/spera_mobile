import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';

class SideTitle extends StatelessWidget {
  const SideTitle({
    super.key,
    required this.title,
    required this.action,
    required this.onTap,
  });

  final String title;
  final String action;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyle24,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            action,
            style: AppTextStyles.textStyle19.copyWith(
              color: AppColors.accentColor.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }
}