import 'package:flutter/material.dart';

Padding part(bool active,
    {double? left,
    double? top,
    double? right,
    double? bottom,
    bool isPreview = false,
    bool isInvisile = false}) {
  return Padding(
    padding: active ? const EdgeInsets.all(2) : const EdgeInsets.all(0),
    child: Container(
      width: active ? 25 : 20,
      height: active ? 25 : 20,
      decoration: isInvisile
          ? null
          : BoxDecoration(
              color: isPreview ? Colors.lightBlue : Colors.blue,
              border: Border(
                bottom: border(active ? 1 : bottom),
                top: border(active ? 1 : top),
                left: border(active ? 1 : left),
                right: border(active ? 1 : right),
              )),
    ),
  );
}

BorderSide border(double? width) {
  width ??= 1;
  return width == 0
      ? BorderSide.none
      : BorderSide(color: Colors.black, width: width);
}
