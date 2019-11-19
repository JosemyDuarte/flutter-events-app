import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/title_text.dart';

class TrendingList extends StatelessWidget {
  final double _height;

  TrendingList(this._height);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TitleText("Trending"),
        HorizontalEventCard(_height),
        HorizontalEventCard(_height),
        HorizontalEventCard(_height),
      ],
    );
  }
}

class HorizontalEventCard extends StatelessWidget {
  final double _cardHeight;

  HorizontalEventCard(this._cardHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: _cardHeight,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
