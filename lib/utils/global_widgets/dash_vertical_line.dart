import 'package:flutter/material.dart';

import '../colors.dart';

class DashedVerticalLine extends StatelessWidget {
  final double dashHeight; // Height of each dash
  final double dashSpace; // Space between dashes
  final Color lineColor; // Line color

  // Constructor
  DashedVerticalLine({
    this.dashHeight = 5,
    this.dashSpace = 12,
    this.lineColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(2, 70), // Vertical line with small width
      painter: _DashedVerticalLinePainter(dashHeight, dashSpace, lineColor),
    );
  }
}

class _DashedVerticalLinePainter extends CustomPainter {
  final double dashHeight;
  final double dashSpace;
  final Color lineColor;

  _DashedVerticalLinePainter(this.dashHeight, this.dashSpace, this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double startY = 0;

    // Draw dashes vertically
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
