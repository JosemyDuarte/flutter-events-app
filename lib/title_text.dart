import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: Row(children: <Widget>[
        Text(
          "Recommended",
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
      ]),
    );
  }
}
