import 'package:blokudoku/models/coord.dart';

import 'dart:math';

class FillTest {
  static List<Coord> staticCoords = [
    Coord(0, 0),
    Coord(1, 0),
    Coord(2, 0),
    Coord(0, 1),
    Coord(1, 1),
    Coord(2, 1),
    Coord(0, 2),
    Coord(1, 2),
    Coord(2, 2),
  ];

  static List<Coord> randomCoords(int? randomSeed) {
    var random = Random(randomSeed);
    return List.generate(
      9,
      (index) => Coord(random.nextInt(9), random.nextInt(9)),
    );
  }
}
