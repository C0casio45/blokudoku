import 'package:blokudoku/grid_widget.dart';
import 'package:blokudoku/next_shapes.dart';
import 'package:flutter/material.dart';

import 'models/coord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ZEHMA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Coord> coords = <Coord>[];
  List<List<Coord>> fullCoords = <List<Coord>>[[], []];
  List<int> remainShapes = <int>[];
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(
                score.toString(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: GridWidget(
                  coords: fullCoords, updateCellState: updateCellState),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
              child: NextShape(remainShape: remainShapes),
            ),
          ],
        ));
  }

  updateScore(int scoreToAdd) {
    setState(() {
      score += scoreToAdd;
    });
  }

  updateCellState(List<Coord> coordList, {int? position, bool test = false}) {
    if (remainShapes.length == 3) remainShapes = <int>[];

    if (test) {
      setState(() {
        fullCoords[1] = coordList;
      });
      return;
    }
    coords += coordList;

    List<List<int>> list = <List<int>>[
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ];
    for (Coord coord in coords) {
      list[0][coord.x]++;
      list[1][coord.y]++;
    }

    List<int> indexListX = buildIndexList(list[0]);

    List<int> indexListY = buildIndexList(list[1]);

    List<Coord> newCoordList = [];

    for (Coord coord in coords) {
      if (!(indexListX.contains(coord.x) || indexListY.contains(coord.y))) {
        newCoordList.add(coord);
        setState(() {
          score++;
        });
      }
    }
    setState(() {
      fullCoords[0] = newCoordList;
      fullCoords[1] = [];
      if (position != null) remainShapes.add(position);
    });
  }

  List<int> buildIndexList(List<int> list) {
    List<int> indexList = [];
    for (int index = 0; index < list.length; index++) {
      if (list[index] == 9) indexList.add(index);
    }
    return indexList;
  }
}
