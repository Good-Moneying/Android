import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/custom_button.dart';

import '../../../design/style/ColorStyles.dart';
import '../../../design/style/FontStyles.dart';
import '../../../design/widgets/appBar/back_appBar.dart';
import '../../../design/widgets/progress_bar.dart';
import '../../../routes/get_pages.dart';

class ResultQuizScreen extends StatelessWidget {
  const ResultQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyProgressBar(
                percent: 1,
                backgroundColor: AppColors.g1,
                progressColor: AppColors.v2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 154.0),
                child: Image.asset(
                  'assets/icons/news_letter_think.png',
                  width: 143,
                  height: 143,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '8개 중 ',
                        style: FontStyles.Headline2_b.copyWith(
                            color: AppColors.black),
                      ),
                      TextSpan(
                        text: '8개 ',
                        style: FontStyles.Headline2_b.copyWith(
                            color: AppColors.v5),
                      ),
                      TextSpan(
                        text: '다 맞혔어요!',
                        style: FontStyles.Headline2_b.copyWith(
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '이미 경제 지식 부자!',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
              ),
              Spacer(),
              CustomButton(
                backgroundColor: AppColors.v6,
                textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
                label: '퀴즈 종료',
                onPressed: () {
                  Get.toNamed(Routes.SHARE);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
