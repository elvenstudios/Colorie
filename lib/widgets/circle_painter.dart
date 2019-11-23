import "dart:math" show pi;

import 'package:colorie/main.dart';
import 'package:colorie/models/log_model.dart';
import 'package:colorie/providers/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CirclePainter extends CustomPainter {
  BuildContext _context;

  CirclePainter(this._context);

  BuildContext get context => _context;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.strokeWidth = 5;
    paint.style = PaintingStyle.stroke;

    var rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    double startAngle = -pi / 2;
    Log log = Provider.of<LogProvider>(context).currentDayLog();

    paint.color = CustomColors.goodColor;
    double greenCurve = log.getGreenPercentageDecimal() * 360;
    double greenAngle = (pi * greenCurve / 180);
    canvas.drawArc(rect, startAngle, greenAngle, false, paint);

    paint.color = CustomColors.almostGoodColor;
    startAngle += greenAngle;
    double yellowCurve = log.getYellowPercentageDecimal() * 360;
    double yellowAngle = (pi * yellowCurve / 180);
    canvas.drawArc(rect, startAngle, yellowAngle, false, paint);

    paint.color = CustomColors.almostBadColor;
    startAngle += yellowAngle;
    double orangeCurve = log.getOrangePercentageDecimal() * 360;
    double orangeAngle = (pi * orangeCurve / 180);
    canvas.drawArc(rect, startAngle, orangeAngle, false, paint);

    paint.color = CustomColors.badColor;
    startAngle += orangeAngle;
    double redCurve = log.getRedPercentageDecimal() * 360;
    double redAngle = (pi * redCurve / 180);
    canvas.drawArc(rect, startAngle, redAngle, false, paint);
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
