import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String _text;

  TitleText(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: Row(children: <Widget>[
        Text(
          _text,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
      ]),
    );
  }
}
