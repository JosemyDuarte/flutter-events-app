import 'package:flutter/material.dart';

class StatsIcon extends StatelessWidget {
  const StatsIcon({
    Key key,
    @required IconData icon,
    @required double iconSize,
    iconColor = Colors.black,
    backgroundColor = Colors.grey,
    @required int stats,
    String suffix = "",
  })  : icon = icon,
        iconSize = iconSize,
        iconColor = iconColor,
        backgroundColor = backgroundColor,
        stats = stats,
        suffix = suffix,
        super(key: key);

  final int stats;
  final String suffix;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Favs pressed");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 0,
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
            shape: new CircleBorder(),
          ),
          Text(
            '$stats $suffix',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
