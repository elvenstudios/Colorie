import 'package:flutter/material.dart';
import './circle_painter.dart';

class CirclePercentage extends StatefulWidget {
  @override
  _CirclePercentageState createState() => _CirclePercentageState();
}

class _CirclePercentageState extends State<CirclePercentage> {
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
            blurRadius: 20.0
          )
        ],
      ),
      margin: EdgeInsets.only(top: 30.0, bottom: 16.0, right: 16.0, left: 16.0),
      width: 225.0,
      height: 225.0,
      child: CustomPaint(
        painter: CirclePainter(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("2150", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
              Text("Total Calories", style: TextStyle(color: Colors.grey, fontSize: 16.0),)
            ],
          ),
        ),
      ),
    );
  }
}
