import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/model/recommended_event.dart';

import 'recommended_carousel.dart';

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

    _nestedTabController = new TabController(length: 7, vsync: this);
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
          labelPadding: EdgeInsets.only(right: 9, left: 9),
          indicatorWeight: 5,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabs: getTabs(),
        ),
        TabBarView(
          controller: _nestedTabController,
          children: getTabsViews(),
        ),
      ],
    );
  }
}

List<Widget> getTabs() {
  return [
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
    Tab(
      text: "Activities",
    ),
    Tab(
      text: "Monuments",
    )
  ];
}

List<Widget> getTabsViews() {
  return [
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
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blueAccent,
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.amberAccent,
      ),
    ),
  ];
}
