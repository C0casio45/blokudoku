import 'package:blokudoku/models/coord.dart';
import 'package:flutter/material.dart';

abstract class Shape {
  int position = 0;
  List<Coord> usedCoords(Coord coord);

  Widget build(BuildContext context,
      {int position = 0, bool used = false, bool test = false}) {
    this.position = position;
    return used
        ? const SizedBox.shrink()
        : Draggable<Shape>(
            data: this,
            feedback: const SizedBox.shrink(),
            childWhenDragging: buildShape(context, true, test),
            child: buildShape(context, false, test),
          );
  }

  Widget buildShape(BuildContext context, bool activated, bool test);
}
