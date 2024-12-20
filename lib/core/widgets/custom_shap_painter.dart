import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path();

    path.moveTo(size.width * 0.5 + (12.w), 0);
    path.lineTo(size.width * 0.5 + (20.w), -7.h);
    path.lineTo(size.width * 0.5 + (28.w), 0);
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(15.r)));

    canvas.drawShadow(path, Colors.black, 7, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}