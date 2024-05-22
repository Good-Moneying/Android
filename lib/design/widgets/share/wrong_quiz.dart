import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class WrongQuiz extends StatelessWidget {
  final String number;
  final String detail;

  const WrongQuiz({
    super.key,
    required this.number,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFEEF0),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFFA5862),
              width: 1,
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    number,
                    style: FontStyles.Ln1_sb.copyWith(
                        color: Color(0xFFFA5862)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  detail,
                  style: FontStyles.Ln1_m.copyWith(color: Color(0xFFFA5862)),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
