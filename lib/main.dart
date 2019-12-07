import 'package:flutter/material.dart';

import 'events/recommended_carousel.dart';
import 'model/recommended_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviefy',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Moviefy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TopText("What event are you looking for you?"),
                          SearchBar(),
                        ])),
                expandedHeight: 150.0,
                bottom: TabBar(
                  controller: _nestedTabController,
                  labelPadding: EdgeInsets.only(right: 9, left: 9),
                  indicatorWeight: 5,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: getTabs(),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _nestedTabController,
            children: getTabsViews(),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemExtent: 250.0,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(10.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(5.0),
            color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
            child: Center(
              child: Text(index.toString()),
            ),
          ),
        ),
      ),
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
//List<Widget> getTabsViews() {
//  return [
//    PageOne(),
//    PageTwo(),
//    PageTwo(),
//    PageTwo(),
//    PageTwo(),
//    PageTwo(),
//    PageTwo(),
//  ];
//}
//
//List<Widget> getTabs() {
//  return [
//    Tab(
//      text: "All",
//    ),
//    Tab(
//      text: "Movies",
//    ),
//    Tab(
//      text: "Events",
//    ),
//    Tab(
//      text: "Plays",
//    ),
//    Tab(
//      text: "Sports",
//    ),
//    Tab(
//      text: "Activities",
//    ),
//    Tab(
//      text: "Monuments",
//    )
//  ];
//}

class TopText extends StatelessWidget {
  final String _text;

  const TopText(
    this._text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 15, bottom: 20),
        child: Container(
          child: Text(
            _text,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Row(
        children: <Widget>[
          IconButton(
            splashColor: Colors.grey,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  hintText: "Search here"),
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
