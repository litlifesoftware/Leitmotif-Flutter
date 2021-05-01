import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundBubblesPainter extends CustomPainter {
  final AnimationController animationController;
  final double baseBubbleSize;
  const BackgroundBubblesPainter({
    required this.animationController,
    this.baseBubbleSize = 59.0,
  });

  Offset calcBubbleOffset(double radius, double rad, Offset center,
      {double? transformDx, double? transformDy}) {
    return Offset(
      (radius * cos(rad) + (center.dx) - (transformDx ?? 0.0)),
      (radius * sin(rad) + (center.dy) - (transformDy ?? 0.0)),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint yellowPaint = Paint()..color = Color(0xFFFBFAF0).withOpacity(0.84);
    Paint cyanPaint = Paint()..color = Color(0xFFE0EFEB).withOpacity(0.93);
    Paint pinkPaint = Paint()..color = Color(0xFFF9E7F4).withOpacity(0.60);
    Paint greenPaint = Paint()..color = Color(0xFFDCE7DC).withOpacity(0.69);
    Paint whitePaint = Paint()..color = Color(0xFFFFFFFF).withOpacity(0.62);

    double yellowRadius = baseBubbleSize;
    double cyanRadius = baseBubbleSize * (51 / 59);
    double pinkRadius = baseBubbleSize;
    double greenRadius = baseBubbleSize * (63 / 59);
    double whiteRadius = baseBubbleSize * (45 / 59);

    Offset center = Offset(size.width / 2, size.height / 2);

    double yellowRad = (3 * (pi / 180) * 360) * animationController.value;
    double cyanRad = (-2 * (pi / 180) * 360) * animationController.value;
    double pinkRad = ((pi / 180) * 360) * animationController.value;
    double greenRad = (-(pi / 180) * 360) * animationController.value;
    double whiteRad = (-3 * (pi / 180) * 360) * animationController.value;

    double yellowTransformDx = 20.0;
    double yellowTransformDy = 20.0;

    double cyanTransformDx = 15.0;
    double cyanTransformDy = 15.0;

    double whiteTransformDx = 30.0;
    double whiteTransformDy = 30.0;

    Offset yellowTransform = calcBubbleOffset(
      yellowRadius,
      yellowRad,
      center,
      transformDx: yellowTransformDx,
      transformDy: yellowTransformDy,
    );

    Offset cyanTransform = calcBubbleOffset(
      cyanRadius,
      cyanRad,
      center,
      transformDx: cyanTransformDx,
      transformDy: cyanTransformDy,
    );

    Offset pinkTransform = calcBubbleOffset(pinkRadius, pinkRad, center);

    Offset greenTransform = calcBubbleOffset(greenRadius, greenRad, center);

    Offset whiteTransform = calcBubbleOffset(
      whiteRadius,
      whiteRad,
      center,
      transformDx: whiteTransformDx,
      transformDy: whiteTransformDy,
    );

    canvas.drawCircle(greenTransform, greenRadius, greenPaint);
    canvas.drawCircle(yellowTransform, yellowRadius, yellowPaint);
    canvas.drawCircle(cyanTransform, cyanRadius, cyanPaint);
    canvas.drawCircle(pinkTransform, pinkRadius, pinkPaint);
    canvas.drawCircle(whiteTransform, whiteRadius, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
