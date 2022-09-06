import 'package:blokudoku/models/coord.dart';
import 'package:blokudoku/utils.dart';
import 'package:flutter/material.dart';
import 'shape.dart';

class Three extends Shape {
  @override
  List<Coord> usedCoords(Coord coord) {
    return <Coord>[
      coord,
      Coord(coord.x, coord.y - 1),
      Coord(coord.x, coord.y - 2),
    ];
  }

  @override
  Widget buildShape(BuildContext context, bool activated, bool test) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        part(activated, isPreview: test),
        part(activated, top: 0, bottom: 0, isPreview: test),
        part(activated, isPreview: test)
      ],
    );
  }
}
