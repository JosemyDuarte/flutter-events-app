import 'package:flutter/material.dart';

import 'title_text.dart';

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
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            MoviePoster(),
            MovieDescription(),
          ],
        ),
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width * 0.33),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

class MovieDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "IRON MAN",
              style: Theme.of(context).textTheme.title,
            )),
            Container(
              child: Text(
                "Iron Man is a 2008 American superhero film based on the Marvel Comics character of the same name.",
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 15),
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star),
                Text("94%"),
                Icon(Icons.remove_red_eye),
                Text("12K"),
                Icon(Icons.message),
                Text("8K"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
