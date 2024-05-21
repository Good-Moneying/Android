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
    return Card(
      color: AppColors.g1,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 4, horizontal: 8),
        child: Text(
          label,
          style: FontStyles.Caption2_m.copyWith(
              color: AppColors.g6),
        ),
      ),
    );
  }
}
