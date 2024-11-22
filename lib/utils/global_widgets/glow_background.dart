import 'package:flutter/material.dart';
import '../size_config.dart';
import 'glow_container.dart';

class GlowBackground extends StatelessWidget {
  const GlowBackground({
    super.key,
    required this.child,
    required this.firstColor,
    required this.bottomPosition,
    required this.rightPosition,
    this.lPadding,
    this.tPadding,
    this.rPadding,
    this.bPadding,
    this.isAnimating = false,
    this.secColor,
    this.secBottomPosition,
    this.secRightPosition,
  });

  final Widget child;
  final Color firstColor;
  final Color? secColor;
  final double bottomPosition;
  final double rightPosition;
  final double? secBottomPosition;
  final double? secRightPosition;
  final double? lPadding;
  final double? tPadding;
  final double? rPadding;
  final double? bPadding;
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GlowContainer(
            color: firstColor,
            bottomPosition: bottomPosition,
            rightPosition: rightPosition,
            isAnimating: isAnimating,
          ),
          GlowContainer(
            color: secColor ?? firstColor,
            bottomPosition: secBottomPosition ??
                bottomPosition + (-screenHeight(context) * 0.5),
            rightPosition: secRightPosition ??
                rightPosition + (-screenWidth(context) * 0.9),
            isAnimating: isAnimating,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                lPadding ?? screenWidth(context) * 0.05,
                tPadding ?? screenHeight(context) * 0.04,
                rPadding ?? screenWidth(context) * 0.05,
                bPadding ?? 0,
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}