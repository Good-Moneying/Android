import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class SummaryDialog extends StatelessWidget {
  const SummaryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(13.2),
      ),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children :[
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              }
                ,child: SvgPicture.asset('assets/icons/plus_close.svg'))
          ]
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: '작성하고 ',
              style: FontStyles.Headline1_b.copyWith(
                  color: AppColors.black), //기본style을 지정해줘야함
              children: <TextSpan>[
                TextSpan(
                  text: '‘요약하기’'
                  ,style: FontStyles.Headline1_b.copyWith(
                    color: AppColors.v6), //기본style을 지정해줘야함
                ),
                TextSpan(
                  text: '를 눌러주세요'
                  ,style: FontStyles.Headline1_b.copyWith(
                    color: AppColors.black), //기본style을 지정해줘야함
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "다 쓰고 요약만 하면 바로 등록할 수 있어요.",
              style:
              FontStyles.Caption1_m.copyWith(
                  color: AppColors.g4),
            ),
          ),
          Image.asset('assets/icons/plus_cloud5.png', width: 270, height: 270,),
        ],
      ),
    );
  }
}