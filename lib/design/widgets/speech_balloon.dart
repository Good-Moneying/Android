import 'package:flutter/material.dart';
import 'package:meetup/design/style/ColorStyles.dart';

import '../style/FontStyles.dart';

class SpeechBalloon extends StatelessWidget {
  final String comment;

  const SpeechBalloon({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        padding: EdgeInsets.only(
          top: 25,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        color: AppColors.g4,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              comment,
              style: FontStyles.Caption2_r.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
      clipper: MyClipper(),
    );
  }
}

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
    path.quadraticBezierTo(
        size.width, size.height, size.width - 15, size.height);
    path.lineTo(15, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 15);
    path.lineTo(0, 30);
    path.quadraticBezierTo(0, 15, 15, 15);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
