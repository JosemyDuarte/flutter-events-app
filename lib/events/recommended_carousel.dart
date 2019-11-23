import 'package:flutter/material.dart';

import 'title_text.dart';

class RecommendedCarousel extends StatelessWidget {
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
        Carousel(),
      ],
    );
  }
}

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Card(
          elevation: 0,
          child: Center(child: CarouselItem()),
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
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
                  image: ExactAssetImage("assets/images/sonic.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Text("Sonic"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Icon(Icons.star), Text("94%")],
          )
        ],
      ),
    );
  }
}
