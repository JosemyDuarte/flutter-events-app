import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/model/recommended_event.dart';

import 'title_text.dart';

class RecommendedCarousel extends StatelessWidget {
  final List<RecommendedEventModel> _recommendedEvents;

  RecommendedCarousel(this._recommendedEvents);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(child: _buildCarousel(screenHeight));
  }

  Widget _buildCarousel(double screenHeight) {
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
          child: Center(child: CarouselItem(_recommendedEvents[index])),
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
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
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
          Text(_recommendedEvent.tittle),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.star),
              Text('${_recommendedEvent.rating}%')
            ],
          )
        ],
      ),
    );
  }
}
