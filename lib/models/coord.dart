class Coord {
  int x;
  int y;
  Coord(this.x, this.y);

  @override
  String toString() => '{$x,$y}';
  @override
  bool operator ==(other) => other is Coord && x == other.x && y == other.y;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + x.hashCode;
    result = 37 * result + y.hashCode;
    return result;
  }

  bool match(Coord other) => x == other.x && y == other.y;
}
