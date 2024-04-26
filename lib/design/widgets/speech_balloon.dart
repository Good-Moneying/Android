import 'package:flutter/material.dart';

Widget bubbleWidget({
  required String comment,
  Color color = Colors.grey,
}) =>
    ClipPath(
      child: Container(
        padding: EdgeInsets.only(
          top: 25,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              comment,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      clipper: MyClipper(),
    );

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(15, 15);
    path.lineTo(30, 15);
    path.lineTo(30, 5);
    path.quadraticBezierTo(30, 2, 32, 2);
    path.lineTo(48, 15);
    path.lineTo(size.width - 15, 15);
    path.quadraticBezierTo(size.width, 15, size.width, 30);
    path.lineTo(size.width, size.height - 15);
    path.quadraticBezierTo(size.width, size.height, size.width - 15, size.height);
    path.lineTo(15, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 15);
    path.lineTo(0, 30);
    path.quadraticBezierTo(0, 15, 15, 15);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
