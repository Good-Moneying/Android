import 'package:flutter/material.dart';

class ToolTipBalloon extends ShapeBorder {
  final bool usePadding;

  ToolTipBalloon({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    //위치 조정
    rect =
        Rect.fromPoints(rect.topLeft + const Offset(0, 0), rect.bottomRight);
    //화살표 모양 및 위치 조정
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
      ..moveTo(rect.topCenter.dx - 3, rect.topCenter.dy)
      ..relativeLineTo(4, -8)
      ..relativeLineTo(4, 8)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}