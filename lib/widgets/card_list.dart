import 'package:flutter/material.dart';
import 'package:colorie/widgets/color_card.dart';

class CardList extends StatefulWidget {
  CardList({Key key, this.rawList}) : super(key: key);
  final List rawList;

  String getGreenPercentage() {
    //TODO: get average percentage of green
    return '20%';
  }

  String getYellowPercentage() {
    //TODO: get average percentage of yellow
    return '20%';
  }

  String getOrangePercentage() {
    //TODO: get average percentage of orange
    return '20%';
  }

  String getRedPercentage() {
    //TODO: get average percentage of red
    return '20%';
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
          subtext: '< 300 cal per lb',
          percentageTitle: widget.getGreenPercentage(),
        ),
        ColorCard(
          title: 'Plenty',
          borderColor: Colors.amberAccent,
          subtext: '< 600 cal per lb',
          percentageTitle: widget.getYellowPercentage(),
        ),
        ColorCard(
          title: 'Some',
          borderColor: Colors.orangeAccent,
          subtext: '< 1500 cal per lb',
          percentageTitle: widget.getOrangePercentage(),
        ),
        ColorCard(
          title: 'Few',
          borderColor: Colors.pinkAccent,
          subtext: '> 1500 cal per lb',
          percentageTitle: widget.getRedPercentage(),
        ),
      ],
    );
  }
}
