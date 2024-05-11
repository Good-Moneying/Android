import 'package:flutter/material.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: const VisualDensity(
        horizontal: 2,
        vertical: -4,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      backgroundColor: AppColors.g1,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      label: Text(
        label,
        style: FontStyles.Caption2_m.copyWith(
            color: AppColors.g6),
      ),
    );
  }
}
