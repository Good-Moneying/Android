import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/design/widgets/share/choice_quiz.dart';

class OneQuizScreen extends StatelessWidget {
  const OneQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Quiz 2',
                  style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  '정부는 앞으로 전기차 정책의 방향성은?',
                  style: FontStyles.Bn1_b.copyWith(color: AppColors.g6),
                ),
              ),
              ChoiceQuiz(number: 'A', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              ChoiceQuiz(number: 'B', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              Spacer(),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      backgroundColor: AppColors.v1,
                      textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.v5),
                      label: '힌트 보기',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      backgroundColor: AppColors.v1,
                      textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.v5),
                      label: '정답 제출하기',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
