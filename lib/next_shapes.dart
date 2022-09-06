import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/shapes/shapes.dart';

class NextShape extends StatefulWidget {
  const NextShape({Key? key, this.remainShape}) : super(key: key);

  final List<int>? remainShape;

  @override
  State<NextShape> createState() => _NextShapeState();
}

class _NextShapeState extends State<NextShape> {
  late List<Shape> nextShapes;

  @override
  void initState() {
    super.initState();

    setState(() {
      nextShapes = nextRandom();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> remainShape = widget.remainShape!;
    if (remainShape.length == 3) {
      nextShapes = nextRandom();
      remainShape = <int>[];
    }
    return SizedBox(
      width: 500,
      height: 150,
      child: GridView.count(
        crossAxisCount: 3,
        children: nextShapesHandler(remainShape),
      ),
    );
  }

  nextShapesHandler(remainShape) {
    List<Widget> buildedNextShapes = <Widget>[];
    for (int pos = 0; pos < 3; pos++) {
      bool used = remainShape.contains(pos);
      buildedNextShapes
          .add(nextShapes[pos].build(context, position: pos, used: used));
    }
    return buildedNextShapes;
  }

  List<Shape> nextRandom() {
    List<Shape> shapesList = [
      One(),
      Two(),
      TwoWithDot(),
      TwoWithTwoDots(),
      Three(),
      ThreeWithDot(),
      ThreeWithTwoDots(),
      Stairs(),
      Square(),
    ];

    Random r = Random();

    return <Shape>[
      shapesList[r.nextInt(9)],
      shapesList[r.nextInt(9)],
      shapesList[r.nextInt(9)]
    ];
  }
}
