import 'package:events_jd/events/trending_list.dart';
import 'package:events_jd/model/recommended_event.dart';
import 'package:events_jd/model/trending_event.dart';
import 'package:flutter/material.dart';

import 'stats_icon.dart';
import 'title_text.dart';

class Events extends StatelessWidget {
  final List<RecommendedEventModel> _recommendedEvents;

  Events(this._recommendedEvents);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            TitleText("Recommended"),
            Carousel(
                screenHeight: screenHeight,
                recommendedEvents: _recommendedEvents),
            TitleText("Trending"),
            TrendingList(TrendingEventsClient.fetchAll()),
          ]),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    Key key,
    @required this.screenHeight,
    @required List<RecommendedEventModel> recommendedEvents,
  })  : _recommendedEvents = recommendedEvents,
        super(key: key);

  final double screenHeight;
  final List<RecommendedEventModel> _recommendedEvents;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.40,
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
