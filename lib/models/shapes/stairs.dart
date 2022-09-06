import 'package:blokudoku/models/coord.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';
import 'shape.dart';

class Stairs extends Shape {
  @override
  List<Coord> usedCoords(Coord coord) {
    return <Coord>[
      Coord(coord.x + 1, coord.y - 1),
      Coord(coord.x, coord.y - 1),
      Coord(coord.x, coord.y),
      Coord(coord.x - 1, coord.y)
    ];
  }

  @override
  Widget buildShape(BuildContext context, bool activated, bool test) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            part(activated, isInvisile: true, isPreview: test),
            part(activated, isPreview: test),
            part(activated, left: 0, isPreview: test),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            part(activated, isPreview: test),
            part(activated, top: 0, left: 0, isPreview: test),
            part(activated, isInvisile: true, isPreview: test),
          ],
        ),
      ],
    );
  }
}
