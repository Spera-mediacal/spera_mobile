import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spera_mobile/utils/colors.dart';

import '../constants.dart';
import '../size_config.dart';

class WavesBackground extends StatelessWidget {
  const WavesBackground({super.key, required this.child, this.wavesColor});

  final Color? wavesColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: SvgPicture.asset(
            colorFilter: ColorFilter.mode(
              wavesColor ?? AppColors.accentColor,
              BlendMode.srcIn,
            ),
            width: screenWidth(context),
            height: screenHeight(context),
            fit: BoxFit.cover,
            AssetsPaths.wavesAssetPath,
          ),
        ),
        Align(alignment: Alignment.topCenter, child: child)
      ],
    );
  }
}
