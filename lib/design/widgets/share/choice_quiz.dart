import 'package:flutter/material.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class ChoiceQuiz extends StatelessWidget {
  final String number;
  final String detail;

  const ChoiceQuiz({
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
          color: AppColors.g1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    number,
                    style:
                    FontStyles.Ln1_sb.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
            ),
            Text(
              detail,
              style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
