import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth(context) * 0.7,
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.bgColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class BotMessage extends StatelessWidget {
  const BotMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/media/spera_head.svg',
          width: 35,
          height: 35,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: AppTextStyles.textStyle15,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}
