import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.strokeWidth = 5;
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width/2, size.height/2), size.width/2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}