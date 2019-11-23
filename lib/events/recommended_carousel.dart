import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/model/recommended_event.dart';

import 'stats_icon.dart';
import 'title_text.dart';

class RecommendedCarousel extends StatelessWidget {
  final List<RecommendedEventModel> _recommendedEvents;

  RecommendedCarousel(this._recommendedEvents);

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildCarousel());
  }

  Widget _buildCarousel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TitleText("Recommended"),
        Carousel(_recommendedEvents),
      ],
    );
  }
}

class Carousel extends StatelessWidget {
  final List<RecommendedEventModel> _recommendedEvents;

  Carousel(this._recommendedEvents);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _recommendedEvents.length,
        itemBuilder: (BuildContext context, int index) => Card(
          elevation: 0,
          child: CarouselItem(_recommendedEvents[index]),
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final RecommendedEventModel _recommendedEvent;

  CarouselItem(this._recommendedEvent);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.34,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: ExactAssetImage(_recommendedEvent.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          _recommendedEvent.tittle,
          style: TextStyle(fontSize: 17),
        ),
        StatsIcon(
          icon: Icons.star,
          iconSize: 18,
          iconColor: Colors.red,
          backgroundColor: Colors.pink[100],
          stats: _recommendedEvent.rating,
          suffix: "%",
        ),
      ],
    );
  }
}
