import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class StopDialong extends StatelessWidget {
  const StopDialong({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(13.2),
      ),
      title: Text(
        "아직 생각 구름이 만들어지지 않았어요!",
        style: FontStyles.Headline1_b.copyWith(
            color: AppColors.black),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "정말 그만두시겠어요? 조금만 더 하면 완성해요!",
            style:
            FontStyles.Caption1_m.copyWith(
                color: AppColors.g4),
          ),
          Image.asset('assets/icons/plus_dialog_char.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 114, height: 48
                ,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.g2)
              ),
                child: Center(child: Text('그만하기', style: FontStyles.Ln1_sb.copyWith(color: AppColors.g4),)),
              ),
              Container(
                width: 167, height: 48
                ,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: AppColors.v6
              ),
                child: Center(child: Text('구름 만들기', style: FontStyles.Ln1_sb.copyWith(color: AppColors.white),)),
              ),
            ],
          )
        ],
      ),
    );
  }
  }