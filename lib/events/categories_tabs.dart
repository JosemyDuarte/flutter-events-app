import 'package:events_jd/events/events.dart';
import 'package:events_jd/model/recommended_event.dart';
import 'package:flutter/material.dart';

class CategoriesTab {
  TabController _nestedTabController;

  CategoriesTab({@required TickerProvider vsync})
      : _nestedTabController =
            new TabController(length: _getTabs().length, vsync: vsync);

  TabBar categoriesTabBar() {
    return TabBar(
      controller: _nestedTabController,
      labelPadding: EdgeInsets.only(right: 9, left: 9),
      indicatorWeight: 5,
      indicatorColor: Colors.blue,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      isScrollable: true,
      tabs: _getTabs(),
    );
  }

  TabBarView categoriesTabBarView() {
    return TabBarView(
      controller: _nestedTabController,
      children: _getTabsViews(),
    );
  }

  static List<Widget> _getTabs() {
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

  List<Widget> _getTabsViews() {
    return [
      Events(RecommendedEventsClient.fetchAll()),
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

  void dispose() {
    _nestedTabController.dispose();
  }
}
