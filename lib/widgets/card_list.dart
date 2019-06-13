import 'package:flutter/material.dart';
import 'package:colorie/widgets/color_card.dart';

class CardList extends StatefulWidget {
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
          percentageTitle: '29%',
        ),
        ColorCard(
          title: 'Plenty',
          borderColor: Colors.amberAccent,
          subtext: '< 600 cal per lb',
          percentageTitle: '43%',
        ),
        ColorCard(
          title: 'Some',
          borderColor: Colors.orangeAccent,
          subtext: '< 1500 cal per lb',
          percentageTitle: '17%',
        ),
        ColorCard(
          title: 'Few',
          borderColor: Colors.pinkAccent,
          subtext: '> 1500 cal per lb',
          percentageTitle: '11%',
        ),
      ],
    );
  }
}
