import 'package:flutter/material.dart';
import 'models/coord.dart';
import 'models/shapes/shape.dart';

class GridWidget extends StatefulWidget {
  const GridWidget(
      {Key? key,
      this.size,
      required this.coords,
      required this.updateCellState})
      : super(key: key);

  final int? size;
  final List<List<Coord>> coords;
  final Function updateCellState;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: tableGenerator(
          widget.size ?? 9, widget.coords, widget.updateCellState),
    );
  }

  List<TableRow> tableGenerator(
      int size, List<List<Coord>> coords, Function updateCellState) {
    List<TableRow> rows = <TableRow>[];

    for (int y = 0; y < size; y++) {
      List<TableCell> cells = <TableCell>[];
      for (int x = 0; x < size; x++) {
        cells.add(TableCell(
          child: buildDraggableCell(x, y, updateCellState, coords[0],
              activated: activated(x, y, coords[0]),
              test: activated(x, y, coords[1])),
        ));
      }
      rows.add(TableRow(children: cells));
    }
    return rows;
  }

  bool activated(int x, int y, List<Coord> coords) {
    return !(Coord(-1, -1).match(coords.firstWhere(
        (it) => it.match(Coord(x, y)),
        orElse: () => Coord(-1, -1))));
  }

  DragTarget<Shape> buildDraggableCell(
      int x, int y, updateCellState, List<Coord> coords,
      {bool activated = false, bool test = false}) {
    return DragTarget<Shape>(
        hitTestBehavior: HitTestBehavior.translucent,
        onLeave: (data) => updateCellState(<Coord>[], test: true),
        onWillAccept: (data) {
          for (var coord in data!.usedCoords(Coord(x, y))) {
            if (coords.contains(coord) ||
                coord.x < 0 ||
                coord.y < 0 ||
                coord.x > 8 ||
                coord.y > 8) {
              return false;
            }
          }
          updateCellState(data.usedCoords(Coord(x, y)), test: true);
          return true;
        },
        onAccept: (data) {
          updateCellState(data.usedCoords(Coord(x, y)),
              position: data.position);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            height: 40,
            color: colorSetter(activated, test),
            key: Key('$x:$y'),
          );
        });
  }

  Color colorSetter(bool activated, bool test) {
    if (activated) return Colors.blue;
    if (test) return const Color.fromARGB(255, 123, 208, 248);
    return Colors.white;
  }
}
