import 'package:blokudoku/models/coord.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';
import 'shape.dart';

class Two extends Shape {
  @override
  List<Coord> usedCoords(Coord coord) {
    return <Coord>[
      coord,
      Coord(coord.x, coord.y + 1),
    ];
  }

  @override
  Widget buildShape(BuildContext context, bool activated, bool test) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: part(activated, isPreview: test)),
        Center(child: part(activated, top: 0, isPreview: test)),
      ],
    );
  }
}
