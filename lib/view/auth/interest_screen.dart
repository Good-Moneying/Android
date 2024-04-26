import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            //진행률 바
            LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              percent: 0.77,
              backgroundColor: AppColors.g1,
              progressColor: AppColors.y3,
              barRadius: Radius.circular(10),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '3/4',
                  style: FontStyles.Caption1_r.copyWith(color: AppColors.g4),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            RichText(
              text: TextSpan(
                children: [TextSpan(text: '00',
                  style: FontStyles.Title2_b.copyWith(color: AppColors.v5),
                ),
                  TextSpan(text: '님의',
                    style: FontStyles.Title2_m.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '관심사',
                    style: FontStyles.Title2_b.copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: '를 알려주세요',
                    style:
                    FontStyles.Title2_m.copyWith(color: AppColors.black),
                  )
                ],
              ),
            ),
            Text('관심사와 관련된 뉴스레터를 받아보세요!',
            style: FontStyles.Label2_sb.copyWith(color: AppColors.g4),
            ),
            Spacer(),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.FREQUENCY);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: AppColors.v5,
                ),
                child: Text(
                  '다음',
                  style: FontStyles.Bn1.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
