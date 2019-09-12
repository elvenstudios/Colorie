import 'package:flutter/material.dart';
import "dart:math" show pi;
import 'package:colorie/models/log_model.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.strokeWidth = 5;
    paint.style = PaintingStyle.stroke;

    //Log logfile; //get logfile from store

    var rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    double startAngle = -pi / 2;

    paint.color = Colors.greenAccent;
    //double greenCurve =  logfile.getGreenPercentage()/100*360;
    double greenAngle = pi * 40 / 180; //hardcoded should be line below
    // double greenAngle = pi * greenCurve / 180
    canvas.drawArc(rect, startAngle, greenAngle, false, paint);

    paint.color = Colors.yellowAccent;
    startAngle += greenAngle;
    //double yellowCurve = logfile.getYellowPercentage()/100*360;
    double yellowAngle = pi * 100 / 180; //hardcoded should be line below
    // double yellowAngle = pi * yellowCurve / 180
    canvas.drawArc(rect, startAngle, yellowAngle, false, paint);

    paint.color = Colors.orangeAccent;
    startAngle += yellowAngle;
    //double orangeCurve = logfile.getOrangePercentage()/100*360;
    double orangeAngle = pi * 120 / 180; //hardcoded should be line below
    // double orangeAngle = pi * orangeCurve / 180
    canvas.drawArc(rect, startAngle, orangeAngle, false, paint);

    paint.color = Colors.redAccent;
    startAngle += orangeAngle;
    //double redCurve =    logfile.getRedPercentage()/100*360;
    double redAngle = pi * 100 / 180; //hardcoded should be line below
    // double redAngle = pi * redCurve / 180
    canvas.drawArc(rect, startAngle, redAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
