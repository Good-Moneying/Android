import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../design/style/ColorStyles.dart';
import '../../../design/style/FontStyles.dart';
import '../../../design/widgets/appBar/back_appBar.dart';
import '../../../design/widgets/custom_button.dart';
import '../../../design/widgets/progress_bar.dart';
import '../../../design/widgets/share/choice_quiz.dart';
import '../../../design/widgets/share/hint_dialog.dart';

class TwoQuizScreen extends StatelessWidget {
  const TwoQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black, title: null,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyProgressBar(
                percent: 0.15,
                backgroundColor: AppColors.g1,
                progressColor: AppColors.v2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48, bottom: 4.0),
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
              ChoiceQuiz(number: 'C', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              ChoiceQuiz(number: 'D', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              Spacer(),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      backgroundColor: AppColors.v1,
                      textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.v5),
                      label: '힌트 보기',
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return HintDialog();
                              },
                            );
                          },
                        );
                      },
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
                      onPressed: null,
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