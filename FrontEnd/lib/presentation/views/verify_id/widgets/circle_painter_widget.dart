import 'package:flutter/material.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorUtils.textColor.withOpacity(.7)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = Colors.transparent;

    paint.blendMode = BlendMode.clear;
    Rect ovalRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 300,
      height: 400,
    );
    canvas.drawOval(ovalRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}