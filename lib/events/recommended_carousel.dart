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
        Expanded(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) => Card(
              child: Center(child: _buildCarouselItem(context, index)),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
