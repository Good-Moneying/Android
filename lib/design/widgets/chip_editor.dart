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
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Chip(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        backgroundColor: AppColors.v1,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        label: Text(
          label,
          style: FontStyles.Caption2_sb.copyWith(
              color: AppColors.v3),
        ),
      ),
    );
  }
}
