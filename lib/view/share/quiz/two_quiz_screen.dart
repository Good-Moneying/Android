import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/share/answer_quiz.dart';
import 'package:meetup/design/widgets/share/wrong_quiz.dart';

import '../../../design/style/ColorStyles.dart';
import '../../../design/style/FontStyles.dart';
import '../../../design/widgets/appBar/back_appBar.dart';
import '../../../design/widgets/appBar/quiz_appBar.dart';
import '../../../design/widgets/chip_editor.dart';
import '../../../design/widgets/custom_button.dart';
import '../../../design/widgets/home/news_slider.dart';
import '../../../design/widgets/home/recommend_box.dart';
import '../../../design/widgets/progress_bar.dart';
import '../../../design/widgets/share/choice_quiz.dart';
import '../../../design/widgets/share/hint_dialog.dart';
import '../../../routes/get_pages.dart';
import '../../../viewModel/home_viewModel.dart';
import '../../../viewModel/quiz_viewModel.dart';
import '../../../design/widgets/history_widget.dart';


final quizController = Get.find<QuizViewModel>();
final homeController = Get.find<HomeViewModel>();


class TwoQuizScreen extends GetView<QuizViewModel> {
  const TwoQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizViewModel());
    return Scaffold(
      appBar: QuizAppBar(
        onPressed: () {
          controller.init2(true);
          Get.back();
        },
      ),
      body:
      Obx(() {
        if (controller.correctSubmitQ2.value) {
          return _quizCorrect();
        } else if (controller.wrongSubmitQ2.value) {
          return _quizFalse(controller.wrongQ2.value, controller.wrongDetail2.value);
        } else {
          return _quiz(context);
        }
      }),
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
            percent: 0.5,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('2/4',
                  style: FontStyles.Caption1_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 4.0),
            child: Text(
              'Quiz 2',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '코인의 가격 변동성이 주식의 몇 배에 달한다고 하나요?',
              style: FontStyles.Bn1_b.copyWith(color: AppColors.g6),
            ),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init2(false);
                  //quizController.firstQ2(true);

                  quizController.selectQ2(0);

                  quizController.wrongQ2('A');
                  quizController.wrongDetail2('2~3배');
                },
                child: quizController.q2List[0] ?
                AnswerQuiz(number: 'A', detail: '2~3배') :
                ChoiceQuiz(number: 'A', detail: '2~3배')),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init2(false);
                  //quizController.secondQ2(true);

                  quizController.selectQ2(1);
                },
                child: quizController.q2List[1] ?
                AnswerQuiz(number: 'B', detail: '3~4배') :
                ChoiceQuiz(number: 'B', detail: '3~4배')
            ),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init2(false);
                  //quizController.thirdQ2(true);

                  quizController.selectQ2(2);

                  quizController.wrongQ2('C');
                  quizController.wrongDetail2('4~5배');
                },
                child:
                quizController.q2List[2] ?
                AnswerQuiz(number: 'C', detail: '4~5배') :
                ChoiceQuiz(number: 'C', detail: '4~5배')
            ),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init2(false);
                  //quizController.fourthQ2(true);

                  quizController.selectQ2(3);

                  quizController.wrongQ2('D');
                  quizController.wrongDetail2('5~6배');
                },
                child: quizController.q2List[3] ?
                AnswerQuiz(number: 'D', detail: '5~6배') :
                ChoiceQuiz(number: 'D', detail: '5~6배')
            ),
          ),
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
                  backgroundColor: AppColors.v6,
                  textStyle: FontStyles.Bn1_b.copyWith(color:
                  quizController.q2List.contains(true)
                      ? AppColors.white
                      : Color(0xFFAAAAB9)),
                  label: '정답 제출하기',
                  onPressed: quizController.q2List.contains(true)
                      ?  () {
                    if(quizController.q2List[1]) {
                      //정답인 경우
                      quizController.correctSubmitQ2(true);
                    } else {
                      quizController.wrongSubmitQ2(true);
                    }

                  } : null,
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
            percent: 0.5,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('2/4',
                  style: FontStyles.Caption1_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 4.0),
            child: Text(
              'Quiz 2',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '코인의 가격 변동성이 주식의 몇 배에 달한다고 하나요?',
              style: FontStyles.Bn1_b.copyWith(color: AppColors.g6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/agreement.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '정답이에요!',
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
                  )),
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
                          'B',
                          style:
                          FontStyles.Ln1_sb.copyWith(color: AppColors.v6),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        '해외 제품에서 발암 물질이 검출되거나 짝퉁 논란이 있기 때문에',
                        style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                        softWrap: true,
                      ),
                    ),
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
              quizController.wrongSubmitQ2(false);
              quizController.correctSubmitQ2(false);
              quizController.quizResult.value++;
              Get.toNamed(Routes.THIRDQUIZ);
              //다음 퀴즈로 넘어가는 화면 만들기
            },
          ),
        ],
      ),
    ),
  );
}

_quizFalse(String q, String detail) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyProgressBar(
            percent: 0.5,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('2/4',
                  style: FontStyles.Caption1_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 4.0),
            child: Text(
              'Quiz 2',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '코인의 가격 변동성이 주식의 몇 배에 달한다고 하나요?',
              style: FontStyles.Bn1_b.copyWith(color: AppColors.g6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/quiz_falseCloud.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '아쉽지만 정답이 아니에요!',
                  style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          //사용자가 고른 틀린 답
          WrongQuiz(number: q, detail: detail),
          //퀴즈의 원래 정답
          AnswerQuiz(number: 'B', detail: '3~4배'),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              '관련 뉴스',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: RecommendU(
              image:
              homeController.homeModel?.realtimeTrendNewsLetters[2].thumbnail ?? 'no data',
              title:
              '코인 변동성 얼마나 클까…주식의 3~4배',
              tag: CustomChip(label: homeController.parseCustom3()[0],),
              isRecommend: homeController.isRecommendThird.value,
              onRecommend: () {
                homeController.isRecommendThird.value
                    ? homeController.isRecommendThird.value = false
                    : homeController.isRecommendThird.value = true;
              },
              history: History(
                diff: homeController.formatDate(
                  DateTime.parse(homeController
                      .homeModel!.realtimeTrendNewsLetters[2].createdAt),
                ),
              ),
            )
          ),
          CustomButton(
            backgroundColor: AppColors.v6,
            textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
            label: '다음',
            onPressed: () {
              quizController.wrongSubmitQ2(false);
              quizController.correctSubmitQ2(false);
              Get.toNamed(Routes.THIRDQUIZ);
              //다음 퀴즈로 넘어가는 화면 만들기
            },
          ),
        ],
      ),
    ),
  );
}
