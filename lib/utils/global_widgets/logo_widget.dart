import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spera_mobile/utils/colors.dart';

import '../constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.width,
    required this.height,
    this.color,
  });

  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Constants.logoAssetPath,
      colorFilter: ColorFilter.mode(
        color ?? AppColors.accentColor,
        BlendMode.srcIn,
      ),
      width: width,
      height: height,
    );
  }
}
