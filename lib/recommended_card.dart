import 'package:flutter/material.dart';

import 'title_text.dart';

class RecommendedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: _buildCarousel());
  }

  Widget _buildCarousel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TitleText(),
        SizedBox(
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.4),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
