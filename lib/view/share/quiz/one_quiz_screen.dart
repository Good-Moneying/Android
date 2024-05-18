import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/design/widgets/progress_bar.dart';
import 'package:meetup/design/widgets/share/choice_quiz.dart';
import 'package:meetup/design/widgets/share/hint_dialog.dart';

import '../../../design/widgets/home/news_slider.dart';
import '../../../design/widgets/home/recommend_box.dart';
import '../../../routes/get_pages.dart';

class OneQuizScreen extends StatelessWidget {
  const OneQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black, title: null,),
      body: _quizFalse(),
    );
  }
}

_quiz(BuildContext context) {
  return SafeArea(
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
              'Quiz 1',
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
  );
}

_quizCorrect() {
  return SafeArea(
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
              'Quiz 1',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/icons/agreement.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('정답이에요!',
                  style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.v1,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.v6,
                    width: 1,
                  )
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'A',
                          style:
                          FontStyles.Ln1_sb.copyWith(color: AppColors.v6),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '내용',
                    style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            backgroundColor: AppColors.v6,
            textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
            label: '다음',
            onPressed: () {
              //Get.toNamed(Routes.SHARE);
              //다음 퀴즈로 넘어가는 화면 만들기
            },
          ),
        ],
      ),
    ),
  );
}

_quizFalse() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyProgressBar(
            percent: 0.15,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 4.0),
            child: Text(
              'Quiz 1',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/icons/quiz_falseCloud.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('아쉽지만 정답이 아니에요!',
                  style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          //사용자가 고른 틀린 답
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFEEF0),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFFA5862),
                    width: 1,
                  )
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'A',
                          style:
                          FontStyles.Ln1_sb.copyWith(color: Color(0xFFFA5862)),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '내용',
                    style: FontStyles.Ln1_m.copyWith(color: Color(0xFFFA5862)),
                  ),
                ],
              ),
            ),
          ),
          //퀴즈의 원래 정답
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.v1,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.v6,
                    width: 1,
                  )
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'A',
                          style:
                          FontStyles.Ln1_sb.copyWith(color: AppColors.v6),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '내용',
                    style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text('관련 뉴스',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: RecommendU(
              image:
              'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
              title: newsController.homeModel!.customizeNewsLetters[0].title,
              tag: '코인',
              isRecommend: newsController.isRecommendFirst.value,
              onRecommend: () {
                newsController.isRecommendFirst.value
                    ? newsController.isRecommendFirst.value = false
                    : newsController.isRecommendFirst.value = true;
              },
            ),
          ),
          CustomButton(
            backgroundColor: AppColors.v6,
            textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
            label: '다음',
            onPressed: () {
              //Get.toNamed(Routes.SHARE);
              //다음 퀴즈로 넘어가는 화면 만들기
            },
          ),
        ],
      ),
    ),
  );
}
