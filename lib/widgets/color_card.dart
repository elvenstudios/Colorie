import 'package:colorie/providers/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:provider/provider.dart';

class ColorCard extends StatefulWidget {
  ColorCard({
    Key key,
    this.borderColor,
    this.title,
    this.subtext,
    this.percentageTitle,
    this.logItems,
    this.user,
  }) : super(key: key);

  final Color borderColor;
  final String title;
  final String subtext;
  final String percentageTitle;
  final logItems;
  final user;

  @override
  _ColorCardState createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  @override
  Widget build(BuildContext context) {
    //If there are no log items for the given color
    if (widget.logItems.length < 1) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  Text(
                    widget.subtext,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.percentageTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.0, right: 16.0),
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: widget.borderColor, width: 8.0)),
                ),
              ],
            ),
          ],
        ),
      );
    }

    //If there are log items for the given color
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ExpansionTile(
        title: Row(
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
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  Text(
                    widget.subtext,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.percentageTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ],
        ),
        trailing: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: widget.borderColor, width: 8.0),
          ),
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              itemCount: widget.logItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = widget.logItems.toList()[index];
                return Consumer<LogProvider>(builder: (context, logProvider, __) {
                  return ListTile(
                    title: Text(item.foodName),
                    subtitle: Text("${item.calories.toString()} calories"),
                    trailing: IconButton(
                      icon: Icon(
                        FeatherIcons.xCircle,
                        color: Colors.pinkAccent,
                      ),
                      tooltip: 'Remove Item From Log',
                      onPressed: () {
                        logProvider.removeFromLog(item.id);
                      },
                    ),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
