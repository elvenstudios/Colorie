import 'package:flutter/material.dart';

import './circle_painter.dart';

class CirclePercentage extends StatefulWidget {
  final num totalCalories;

  var context;

  CirclePercentage({Key key, this.totalCalories, this.context})
      : super(key: key);

  @override
  _CirclePercentageState createState() => _CirclePercentageState();
}

class _CirclePercentageState extends State<CirclePercentage>
    with SingleTickerProviderStateMixin {
  CirclePainter painter;
  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          new BoxShadow(
              color: Colors.grey,
              offset: new Offset(5.0, 5.0),
              spreadRadius: 1.0,
              blurRadius: 20.0)
        ],
      ),
      margin: EdgeInsets.only(top: 30.0, bottom: 16.0, right: 16.0, left: 16.0),
      width: 225.0,
      height: 225.0,
      child: CustomPaint(
        painter: CirclePainter(context, fraction),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${widget.totalCalories}",
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
              Text(
                "Total Calories",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
