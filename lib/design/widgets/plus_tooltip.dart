import 'package:flutter/material.dart';

class PlusToolTip extends ShapeBorder {
  final bool usePadding;

  PlusToolTip({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // 위치 조정
    rect = Rect.fromPoints(rect.topLeft + const Offset(0, 0), rect.bottomRight);

    // 화살표 모양 및 위치 조정
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
      ..moveTo(rect.bottomCenter.dx - 8, rect.bottomCenter.dy) // 화살표가 아래로 향하도록 위치 조정
      ..relativeLineTo(8, 8) // 화살표를 그리는 명령
      ..relativeLineTo(8, -8)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
