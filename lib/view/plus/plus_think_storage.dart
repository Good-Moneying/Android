import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/appBar/back_appBar.dart';

class PlusThinkStorage extends StatelessWidget {
  const PlusThinkStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.g1,
        appBar: BackAppBar(iconColor: AppColors.black, title: null,),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white
            )
            ,child: SizedBox(
              width: double.infinity, height: 100,
              child : Padding(
                padding: const EdgeInsets.only(left: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center, // 가운데 정렬
                      text: TextSpan(
                        text: '나의 생각',
                        style:
                        FontStyles.Headline1_b.copyWith(color: AppColors.v6),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 모음',
                            style: FontStyles.Headline1_b.copyWith(
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('이 뉴스레터를 통해 나는 이렇게 생각했어요.', style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),),
                    )
                  ],
                ),
              ),

            ),
          ),
              Container(
                  width: 300, height: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.white
                  ),
                  child: Center(
                    child: Text(
                      '테슬라의 기술 혁신', style: FontStyles.Lr1_sb.copyWith(color: AppColors.g6),
                    ),
                  ),
                ),
              Container(
                width: 300, height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.white
                ),
                child: Center(
                  child: Text(
                    '테슬라의 기술 혁신', style: FontStyles.Lr1_sb.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
              Container(
                width: 300, height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.white
                ),
                child: Center(
                  child: Text(
                    '테슬라의 기술 혁신', style: FontStyles.Lr1_sb.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
              Container(
                width: 300, height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.white
                ),
                child: Center(
                  child: Text(
                    '테슬라의 기술 혁신', style: FontStyles.Lr1_sb.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
              Container(
                width: 300, height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.white
                ),
                child: Center(
                  child: Text(
                    '테슬라의 기술 혁신', style: FontStyles.Lr1_sb.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
        ]));
  }
}
