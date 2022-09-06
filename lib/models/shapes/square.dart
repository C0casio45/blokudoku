import 'package:blokudoku/models/coord.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';
import 'shape.dart';

class Square extends Shape {
  @override
  List<Coord> usedCoords(Coord coord) {
    return <Coord>[
      coord,
      Coord(coord.x + 1, coord.y),
      Coord(coord.x, coord.y + 1),
      Coord(coord.x + 1, coord.y + 1)
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
            part(activated, left: 0, isPreview: test),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            part(activated, top: 0, isPreview: test),
            part(activated, top: 0, left: 0, isPreview: test),
          ],
        ),
      ],
    );
  }
}
