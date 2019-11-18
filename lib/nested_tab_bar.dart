import 'package:flutter/material.dart';
import 'package:luxury_bag_collection/event_tab.dart';
import 'package:luxury_bag_collection/trending_list.dart';

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
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
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                text: "One",
              ),
              Tab(
                text: "Two",
              ),
              Tab(
                text: "Three",
              ),
              Tab(
                text: "Four",
              ),
              Tab(
                text: "Five",
              ),
            ],
          ),
          Container(
            height: screenHeight * 0.32,
            child: TabBarView(
              controller: _nestedTabController,
              children: <Widget>[
                EventTab(),
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
          TrendingList()
        ],
      ),
    );
  }
}
