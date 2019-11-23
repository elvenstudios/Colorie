import 'package:colorie/main.dart';
import 'package:colorie/models/log_model.dart';
import 'package:colorie/widgets/color_card.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  CardList({
    Key key,
    this.list,
  }) : super(key: key);
  final Log list;

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
          borderColor: CustomColors.goodColor,
          subtext: 'Goal: 60% or more',
          percentageTitle: widget.list.getGreenPercentage(),
          logItems: widget.list.getGreenLogItems(),
        ),
        ColorCard(
          title: 'Plenty',
          borderColor: CustomColors.almostGoodColor,
          subtext: 'Goal: 25% or more',
          percentageTitle: widget.list.getYellowPercentage(),
          logItems: widget.list.getYellowLogItems(),
        ),
        ColorCard(
          title: 'Some',
          borderColor: CustomColors.almostBadColor,
          subtext: 'Goal: 10% or less',
          percentageTitle: widget.list.getOrangePercentage(),
          logItems: widget.list.getOrangeLogItems(),
        ),
        ColorCard(
          title: 'Few',
          borderColor: CustomColors.badColor,
          subtext: 'Goal: 5% or less',
          percentageTitle: widget.list.getRedPercentage(),
          logItems: widget.list.getRedLogItems(),
        ),
      ],
    );
  }
}
