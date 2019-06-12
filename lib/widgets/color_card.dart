import 'package:flutter/material.dart';

class ColorCard extends StatefulWidget {

  ColorCard({Key key, this.borderColor, this.title, this.subtext, this.percentageTitle}) : super(key: key);
  final Color borderColor;
  final String title;
  final String subtext;
  final String percentageTitle;

  @override
  _ColorCardState createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8.0),
            margin: EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: widget.borderColor,
                    width: 4.0,
                  ),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),),
                Text(widget.subtext, style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey
                ),)
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.percentageTitle, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                  ),),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.borderColor, width: 8.0)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
