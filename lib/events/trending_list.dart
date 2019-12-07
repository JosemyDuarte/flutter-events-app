import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/model/trending_event.dart';

import 'stats_icon.dart';

class TrendingList extends StatelessWidget {
  final List<TrendingEventModel> _trendingEvents;

  TrendingList(this._trendingEvents);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      _trendingEvents.map((event) => HorizontalEventCard(event)).toList(),
    );
  }
}

class HorizontalEventCard extends StatelessWidget {
  final TrendingEventModel _trendingEvent;

  HorizontalEventCard(this._trendingEvent);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            MoviePoster(_trendingEvent.imagePath),
            MovieData(_trendingEvent),
          ],
        ),
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String _imagePath;

  MoviePoster(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width * 0.33),
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: ExactAssetImage(_imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

class MovieData extends StatelessWidget {
  final TrendingEventModel _trendingEvent;

  MovieData(this._trendingEvent);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _trendingEvent.title,
              style: Theme.of(context).textTheme.title,
            ),
            Container(
              child: Text(
                _trendingEvent.description,
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 15),
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StatsIcon(
                  icon: Icons.star,
                  iconSize: 15,
                  iconColor: Colors.red,
                  backgroundColor: Colors.pink[100],
                  stats: _trendingEvent.percentageFavorites,
                  suffix: "%",
                ),
                StatsIcon(
                  icon: Icons.remove_red_eye,
                  iconSize: 15,
                  iconColor: Colors.purple,
                  backgroundColor: Colors.purple[100],
                  stats: _trendingEvent.nViews ~/ 1000,
                  //TODO format number before display
                  suffix: "K",
                ),
                StatsIcon(
                  icon: Icons.message,
                  iconSize: 15,
                  iconColor: Colors.yellow,
                  backgroundColor: Colors.yellow[100],
                  stats: _trendingEvent.nMessages ~/ 1000,
                  //TODO format number before display
                  suffix: "K",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
