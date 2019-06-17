import 'package:flutter/material.dart';
import 'package:colorie/widgets/color_card.dart';
import 'package:colorie/models/log_model.dart';

class CardList extends StatefulWidget {
  CardList({Key key, this.list}) : super(key: key);
  final Log list;


  String getGreenPercentage() {
    print(list.getGreenPercentage());
    return "${(list.getGreenPercentage() * 100).toStringAsFixed(1)}%";
  }

  String getYellowPercentage() {
    return "${(list.getYellowPercentage() * 100).toStringAsFixed(1)}%";
  }

  String getOrangePercentage() {
    return "${(list.getOrangePercentage() * 100).toStringAsFixed(1)}%";
  }

  String getRedPercentage() {
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
