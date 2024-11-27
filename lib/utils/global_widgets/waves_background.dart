import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spera_mobile/utils/colors.dart';

import '../constants.dart';
import '../size_config.dart';

class WavesBackground extends StatelessWidget {
  const WavesBackground({super.key, required this.child, this.wavesColor, this.bottomP, this.rightP, this.externalWidget,});

  final Color? wavesColor;
  final Widget child;
  final Widget? externalWidget;
  final double? bottomP;
  final double? rightP;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: bottomP ?? screenHeight(context)*0.2,
          right: rightP ?? -screenWidth(context)*0.8,
          child: SvgPicture.asset(
            colorFilter: ColorFilter.mode(
              wavesColor ?? AppColors.accentColor,
              BlendMode.srcIn,
            ),
            width: screenWidth(context),
            height: screenHeight(context),
            fit: BoxFit.cover,
            Constants.wavesAssetPath,
          ),
        ),
        externalWidget ?? const SizedBox.shrink(),
        Align(alignment: Alignment.topCenter, child: child)
      ],
    );
  }
}
