import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';

class History extends StatelessWidget {
  final String diff;

  const History({
    super.key,
    required this.diff,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/history.svg'),
        SizedBox(
          width: Get.width*0.01,
        ),
        Text(
          diff,
          style: FontStyles.Caption2_r.copyWith(
              color: AppColors.g5),
        ),
      ],
    );
  }
}
