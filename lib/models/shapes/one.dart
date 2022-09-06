import 'package:blokudoku/models/coord.dart';
import 'package:flutter/material.dart';

import 'shape.dart';
import '../../utils.dart';

class One extends Shape {
  @override
  List<Coord> usedCoords(Coord coord) {
    return <Coord>[coord];
  }

  @override
  Widget buildShape(BuildContext context, bool activated, bool test) {
    return Draggable(
        data: this,
        feedback: const SizedBox.shrink(),
        child: Center(child: part(false, isPreview: test)));
  }
}
