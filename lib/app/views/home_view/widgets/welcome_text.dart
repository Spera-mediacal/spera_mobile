import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    int now = DateTime.now().hour;

    return Row(
      children: [
        Text(
          now > 12 ? 'Good night,\n $name' : 'Good morning,\n $name',
          textAlign: TextAlign.start,
          style: AppTextStyles.textStyle35.copyWith(
            color: AppColors.whiteColor.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}