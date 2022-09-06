import 'package:blokudoku/models/coord.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';
import 'shape.dart';

class ThreeWithDot extends Shape {
  @override
  List<Coord> usedCoords(Coord coord) {
    return <Coord>[
      coord,
      Coord(coord.x, coord.y - 1),
      Coord(coord.x + 1, coord.y),
      Coord(coord.x + 2, coord.y),
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
            part(activated, isPreview: test),
            part(activated, isInvisile: true, isPreview: test),
            part(activated, isInvisile: true, isPreview: test),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            part(activated, top: 0, isPreview: test),
            part(activated, left: 0, right: 0, isPreview: test),
            part(activated, isPreview: test),
          ],
        ),
      ],
    );
  }
}
