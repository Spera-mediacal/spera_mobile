import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/constants.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          (screenHeight(context) * 0.1).sh,
          SvgPicture.asset(
            AssetsPaths.logoAssetPath,
            width: screenWidth(context) * 0.4,
            height: screenHeight(context) * 0.25,
          ),
          (screenHeight(context) * 0.1).sh,
          SizedBox(
            width: screenWidth(context)*0.85,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: AppTextStyles.textStyle19.copyWith(color: AppColors.whiteColor.withOpacity(0.35)),
                prefixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedMail01,
                  color: AppColors.accentColor,
                ),
                filled: true,
                fillColor: AppColors.whiteColor.withOpacity(
                  0.16,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
