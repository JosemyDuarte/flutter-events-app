import 'package:events_jd/events/categories_tabs.dart';
import 'package:flutter/material.dart';

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
  CategoriesTab _categoriesTabs;

  @override
  void initState() {
    super.initState();
    _categoriesTabs = CategoriesTab(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _categoriesTabs.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topLeft,
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 4, right: 4),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                            _TopText("What event are you looking for you?"),
                            _SearchBar(),
                          ])),
                  expandedHeight: 150.0,
                  bottom: _categoriesTabs.categoriesTabBar(),
                ),
              ];
            },
            body: _categoriesTabs.categoriesTabBarView(),
          ),
        ),
      ),
    );
  }
}

class _TopText extends StatelessWidget {
  final String _text;

  const _TopText(
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

class _SearchBar extends StatelessWidget {
  const _SearchBar({
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
