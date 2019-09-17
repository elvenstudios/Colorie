import 'package:colorie/providers/log_provider.dart';
import 'package:flutter/material.dart';
import "dart:math" show pi;
import 'package:colorie/models/log_model.dart';
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

    //Log logfile; //get logfile from store

    var rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    double startAngle = -pi / 2;
    print('Log Painter Log');
    Log log = Log();
    log.setLog(Provider.of<LogProvider>(context).log.getLog());

    paint.color = Colors.greenAccent;
    double greenCurve =log.getGreenPercentageDecimal()  * 360;
    print('greenCurve $greenCurve');
    double greenAngle = (pi * greenCurve / 180) ;
    print('greenAngle $greenAngle');
    canvas.drawArc(rect, startAngle, greenAngle, false, paint);

    paint.color = Colors.yellowAccent;
    startAngle += greenAngle;
    double yellowCurve =log.getYellowPercentageDecimal()  * 360;
    double yellowAngle = (pi * yellowCurve / 180) ;
    canvas.drawArc(rect, startAngle, yellowAngle, false, paint);

    paint.color = Colors.orangeAccent;
    startAngle += yellowAngle;
    double orangeCurve =log.getOrangePercentageDecimal()  * 360;
    double orangeAngle = (pi * orangeCurve / 180) ;
    canvas.drawArc(rect, startAngle, orangeAngle, false, paint);

    paint.color = Colors.redAccent;
    startAngle += orangeAngle;
    double redCurve =log.getRedPercentageDecimal()  * 360;
    double redAngle = (pi * redCurve / 180) ;
    canvas.drawArc(rect, startAngle, redAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
