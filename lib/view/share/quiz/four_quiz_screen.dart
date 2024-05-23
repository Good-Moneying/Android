import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/share/answer_quiz.dart';
import '../../../design/style/ColorStyles.dart';
import '../../../design/style/FontStyles.dart';
import '../../../design/widgets/appBar/quiz_appBar.dart';
import '../../../design/widgets/chip_editor.dart';
import '../../../design/widgets/custom_button.dart';
import '../../../design/widgets/home/news_slider.dart';
import '../../../design/widgets/home/recommend_box.dart';
import '../../../design/widgets/progress_bar.dart';
import '../../../design/widgets/share/choice_quiz.dart';
import '../../../design/widgets/share/hint_dialog.dart';
import '../../../design/widgets/share/wrong_quiz.dart';
import '../../../routes/get_pages.dart';
import '../../../viewModel/home_viewModel.dart';
import '../../../viewModel/quiz_viewModel.dart';
import '../../../design/widgets/history_widget.dart';


final quizController = Get.find<QuizViewModel>();
final homeController = Get.find<HomeViewModel>();


class FourthQuizScreen extends GetView<QuizViewModel> {
  const FourthQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizViewModel());
    return Scaffold(
      appBar: QuizAppBar(
        onPressed: () {
          controller.init4(true);
          Get.back();
        },
      ),
      body: Obx(() {
        if (controller.init4.value) {
          return _quiz(context);
        } else if (controller.fourthQ4.value) {
          return _quizCorrect();
        } else {
          return _quizFalse(controller.wrongQ4.value, controller.wrongDetail4.value);
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
            percent: 1,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('4/4',
                  style: FontStyles.Caption1_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 4.0),
            child: Text(
              'Quiz 4',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '유럽연합(EU)이 중국산 제품에 추가 관세를 부과할 계획인 품목이 아닌 것은 무엇인가요?',
              style: FontStyles.Bn1_b.copyWith(color: AppColors.g6),
            ),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init4(false);
                  //quizController.firstQ4(true);

                  quizController.selectQ4(0);
                  quizController.wrongQ4('A');
                  quizController.wrongDetail4('전기차');
                },
                child:
                quizController.q4List[0] ?
                AnswerQuiz(number: 'A', detail: '전기차') :
                ChoiceQuiz(number: 'A', detail: '전기차')),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init4(false);
                  //quizController.secondQ4(true);

                  quizController.selectQ4(1);

                  quizController.wrongQ4('B');
                  quizController.wrongDetail4('전기자전거');
                },
                child: quizController.q4List[1] ?
                AnswerQuiz(number: 'B', detail: '전기자전거') :
                ChoiceQuiz(number: 'B', detail: '전기자전거')
            ),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init4(false);
                  //quizController.thirdQ4(true);

                  quizController.selectQ4(2);

                  quizController.wrongQ4('C');
                  quizController.wrongDetail4('풍력발전 터빈');
                },
                child:
                quizController.q4List[2] ?
                AnswerQuiz(number: 'C', detail: '풍력발전 터빈') :
                ChoiceQuiz(number: 'C', detail: '풍력발전 터빈')
            ),
          ),
          Obx(
              () => GestureDetector(
                onTap: () {
                  quizController.init4(false);
                  //quizController.fourthQ4(true);

                  quizController.selectQ4(3);
                },
                child: quizController.q4List[3] ?
                AnswerQuiz(number: 'D', detail: '의류') :
                ChoiceQuiz(number: 'D', detail: '의류')
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
                  quizController.q4List.contains(true)
                      ? AppColors.white
                      : Color(0xFFAAAAB9)),
                  label: '정답 제출하기',
                  onPressed: quizController.q4List.contains(true)
                      ?  () {} : null,
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
            percent: 1,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('4/4',
                  style: FontStyles.Caption1_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 4.0),
            child: Text(
              'Quiz 4',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '유럽연합(EU)이 중국산 제품에 추가 관세를 부과할 계획인 품목이 아닌 것은 무엇인가요?',
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
                          'A',
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
                        '의류',
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
              quizController.quizResult.value++;
              Get.toNamed(Routes.RESULTQUIZ);
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
            percent: 1,
            backgroundColor: AppColors.g1,
            progressColor: AppColors.v2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('4/4',
                  style: FontStyles.Caption1_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 4.0),
            child: Text(
              'Quiz 4',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              '유럽연합(EU)이 중국산 제품에 추가 관세를 부과할 계획인 품목이 아닌 것은 무엇인가요?',
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
          AnswerQuiz(number: 'D', detail: '의류'),
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
              homeController.homeModel?.customizeNewsLetters[2].thumbnail ?? 'no data',
              title:
              '너무 싸게 팔아도 문제다?',
              tag: CustomChip(label: homeController.parseCustom1()[0],),
              isRecommend: homeController.isRecommendThird.value,
              onRecommend: () {
                homeController.isRecommendThird.value
                    ? homeController.isRecommendThird.value = false
                    : homeController.isRecommendThird.value = true;
              },
              history: History(
                diff: homeController.formatDate(
                  DateTime.parse(homeController
                      .homeModel!.customizeNewsLetters[2].createdAt),
                ),
              ),
            )
          ),
          CustomButton(
            backgroundColor: AppColors.v6,
            textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
            label: '다음',
            onPressed: () {
              Get.toNamed(Routes.RESULTQUIZ);
              //다음 퀴즈로 넘어가는 화면 만들기
            },
          ),
        ],
      ),
    ),
  );
}