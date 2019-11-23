import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/model/recommended_event.dart';
import 'package:luxury_bag_collection/model/trending_event.dart';

import 'recommended_carousel.dart';
import 'trending_list.dart';

class CategoriesTabBar extends StatefulWidget {
  @override
  _CategoriesTabBarState createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "All",
            ),
            Tab(
              text: "Movies",
            ),
            Tab(
              text: "Events",
            ),
            Tab(
              text: "Plays",
            ),
            Tab(
              text: "Sports",
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.38,
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              RecommendedCarousel(RecommendedEventsClient.fetchAll()),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.indigoAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        TrendingList(TrendingEventsClient.fetchAll())
      ],
    );
  }
}
