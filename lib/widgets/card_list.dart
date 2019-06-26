import 'package:flutter/material.dart';
import 'package:colorie/widgets/color_card.dart';
import 'package:colorie/models/log_model.dart';

class CardList extends StatefulWidget {
  CardList({Key key, this.list, this.isExpanded = false}) : super(key: key);
  final Log list;
  bool isExpanded;

  String getGreenPercentage() {
    if((list.getGreenPercentage() * 100).isNaN)
      return '0%';
    return "${(list.getGreenPercentage() * 100).toStringAsFixed(1)}%";
  }

  String getYellowPercentage() {
    if((list.getYellowPercentage() * 100).isNaN)
      return '0%';
    return "${(list.getYellowPercentage() * 100).toStringAsFixed(1)}%";
  }

  String getOrangePercentage() {
    if((list.getOrangePercentage() * 100).isNaN)
      return '0%';
    return "${(list.getOrangePercentage() * 100).toStringAsFixed(1)}%";
  }

  String getRedPercentage() {
    if((list.getRedPercentage() * 100).isNaN)
      return '0%';
    return "${(list.getRedPercentage() * 100).toStringAsFixed(1)}%";
  }

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ColorCard(
          title: 'Lots',
          borderColor: Colors.greenAccent,
          subtext: 'Goal: 60% or more',
          percentageTitle: widget.getGreenPercentage(),
          logItems: widget.list.getGreenLogItems(),
        ),
        ColorCard(
          title: 'Plenty',
          borderColor: Colors.amberAccent,
          subtext: 'Goal: 25% or more',
          percentageTitle: widget.getYellowPercentage(),
          logItems: widget.list.getYellowLogItems(),
        ),
        ColorCard(
          title: 'Some',
          borderColor: Colors.orangeAccent,
          subtext: 'Goal: 10% or less',
          percentageTitle: widget.getOrangePercentage(),
          logItems: widget.list.getOrangeLogItems(),
        ),
        ColorCard(
          title: 'Few',
          borderColor: Colors.pinkAccent,
          subtext: 'Goal: 5% or less',
          percentageTitle: widget.getRedPercentage(),
          logItems: widget.list.getRedLogItems(),
        ),
      ],
    );
  }
}
