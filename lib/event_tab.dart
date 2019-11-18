import 'package:flutter/material.dart';

import 'recommended_card.dart';

class EventTab extends StatelessWidget {
  EventTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white30,
      ),
      child: Column(
        children: <Widget>[RecommendedCard()],
      ),
    );
  }
}
