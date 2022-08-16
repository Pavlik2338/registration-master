import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class CirclePainter extends CustomPainter {
  final Color color;
  // ignore: use_key_in_widget_constructors
  const CirclePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 4, size.height / 3),
        size.height / 1.8,
        Paint()
          ..style = PaintingStyle.fill
          ..shader = ui.Gradient.linear(
              Offset.zero,
              Offset(size.height / 0.9, size.height / 0.9),
              [color.withOpacity(0), color]));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
