import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final double borderRadius;

  DottedBorderPainter({this.borderRadius = 16});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colours.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 5;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final path = Path()..addRRect(rrect);

    final metric = path.computeMetrics().first;
    final dashPath = Path();

    var distance = 0.0;
    var draw = true;
    while (distance < metric.length) {
      if (draw) {
        final extractPath = metric.extractPath(distance, distance + dashWidth);
        dashPath.addPath(extractPath, Offset.zero);
      }
      distance += draw ? dashWidth : dashSpace;
      draw = !draw;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
