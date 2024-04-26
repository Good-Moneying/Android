import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';

class FrequencyScreen extends StatelessWidget {
  const FrequencyScreen({super.key});

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
              percent: 1,
              backgroundColor: AppColors.g1,
              progressColor: AppColors.y3,
              barRadius: Radius.circular(10),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '4/4',
                  style: FontStyles.Caption1_r.copyWith(color: AppColors.g4),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '뉴스레터',
                    style: FontStyles.Title2_b.copyWith(color: AppColors.v5),
                  ),
                  TextSpan(
                    text: '를',
                    style: FontStyles.Title2_m.copyWith(color: AppColors.black),
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '얼마나 자주',
                    style: FontStyles.Title2_b.copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: ' 읽고 싶으신가요',
                    style: FontStyles.Title2_m.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              '꾸준한 습관을 만들 수 있게 도와드릴게요!',
              style: FontStyles.Label2_sb.copyWith(color: AppColors.g4),
            ),
            SizedBox(height: Get.height * 0.1),
            ElevatedButton(
              onPressed: () {},
              child: Text('매일'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColors.white,
                disabledForegroundColor: AppColors.g4,
                foregroundColor: AppColors.v5,
                side: BorderSide(
                  //삼항 연산자로 비활성&활성 나누기
                  color: AppColors.v5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            ElevatedButton(
              onPressed: () {},
              child: Text('일주일에 5~6번'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColors.white,
                disabledForegroundColor: AppColors.g4,
                foregroundColor: AppColors.v5,
                side: BorderSide(
                  //삼항 연산자로 비활성&활성 나누기
                  color: AppColors.v5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Spacer(),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.WELCOME);
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
