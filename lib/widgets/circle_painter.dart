import "dart:math" show pi;

import 'package:colorie/models/log_model.dart';
import 'package:colorie/providers/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CirclePainter extends CustomPainter {
  BuildContext _context;
  Paint _paint;
  double _fraction;
  CirclePainter(this._context, this._fraction) {
    _paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
  }

  BuildContext get context => _context;

  Paint get paintInstance => _paint;

  @override
  void paint(Canvas canvas, Size size) {
    print('paint $_fraction');

    var rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    print('Log Painter Log');
    Log log = Log()..setLog(Provider.of<LogProvider>(context).log.getLog());

    paintInstance.color = Colors.greenAccent;
    double startAngle = -pi / 2;
    double greenAngle = (pi * log.getGreenPercentageDecimal() * 360 / 180);
    canvas.drawArc(
        rect, startAngle, greenAngle * _fraction, false, paintInstance);

    paintInstance.color = Colors.yellowAccent;
    startAngle += greenAngle;
    double yellowAngle = (pi * log.getYellowPercentageDecimal() * 360 / 180);
    canvas.drawArc(
        rect, startAngle, yellowAngle * _fraction, false, paintInstance);

    paintInstance.color = Colors.orangeAccent;
    startAngle += yellowAngle;
    double orangeAngle = (pi * log.getOrangePercentageDecimal() * 360 / 180);
    canvas.drawArc(
        rect, startAngle, orangeAngle * _fraction, false, paintInstance);

    paintInstance.color = Colors.redAccent;
    startAngle += orangeAngle;
    double redAngle = (pi * log.getRedPercentageDecimal() * 360 / 180);
    canvas.drawArc(
        rect, startAngle, redAngle * _fraction, false, paintInstance);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
