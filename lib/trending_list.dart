import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/title_text.dart';

class TrendingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TitleText("Trending"),
        new Flexible(
          child: new Container(
            height: 200,
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  sliver: new SliverFixedExtentList(
                    itemExtent: 170.0,
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) => HorizontalEventCard(context, index),
                      childCount: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalEventCard extends StatelessWidget {
  HorizontalEventCard(BuildContext context, int index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
