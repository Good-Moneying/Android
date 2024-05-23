import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/view/bottomNavigationBar.dart';
import 'package:meetup/viewModel/app_viewModel.dart';

import '../../../design/style/ColorStyles.dart';
import '../../../design/style/FontStyles.dart';
import '../../../design/widgets/appBar/back_appBar.dart';
import '../../../design/widgets/chip_editor.dart';
import '../../../design/widgets/home/news_slider.dart';
import '../../../design/widgets/home/recommend_box.dart';
import '../../../design/widgets/progress_bar.dart';
import '../../../routes/get_pages.dart';
import '../../../viewModel/home_viewModel.dart';
import '../../../design/widgets/history_widget.dart';
import '../../../viewModel/quiz_viewModel.dart';

final quizController = Get.find<QuizViewModel>();
final homeController = Get.find<HomeViewModel>();
final tapController = Get.find<AppViewModel>();

class ResultQuizScreen extends GetView<QuizViewModel> {
  const ResultQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizViewModel());
    Get.find<AppViewModel>().currentIndex(2);
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black, title: null,),
      body: Obx(
          () {
            if(controller.quizResult==4) {
              return _allCorrect();
            } else {
              return _partCorrect();
            }
          }
      ),
    );
  }
}

_partCorrect() {
  return SafeArea(
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
            padding: const EdgeInsets.only(top: 51.0),
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
                    text: '4개 중 ',
                    style: FontStyles.Headline2_b.copyWith(
                        color: AppColors.black),
                  ),
                  TextSpan(
                    text: '${quizController.quizResult}개',
                    style: FontStyles.Headline2_b.copyWith(
                        color: AppColors.v5),
                  ),
                  TextSpan(
                    text: '나 맞혔어요!',
                    style: FontStyles.Headline2_b.copyWith(
                        color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 47.0),
            child: Text(
              '뉴스레터를 좀 더 꼼꼼히 보면 부자 될 수 있겠어요!',
              style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오답뉴스',
                  style: FontStyles.Headline2_b.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          Container(
            height: Get.height*0.32,
            child: ListView(
              children: <Widget>[
                RecommendU(
                  image:
                  homeController.homeModel?.customizeNewsLetters[0].thumbnail ?? 'no data',
                  title:
                  homeController.homeModel!.customizeNewsLetters[0].title,
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
                          .homeModel!.customizeNewsLetters[0].createdAt),
                    ),
                  ),
                ),
                RecommendU(
                  image:
                  homeController.homeModel?.customizeNewsLetters[1].thumbnail ?? 'no data',
                  title:
                  homeController.homeModel!.customizeNewsLetters[1].title,
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
                          .homeModel!.customizeNewsLetters[1].createdAt),
                    ),
                  ),
                ),
                RecommendU(
                  image:
                  homeController.homeModel?.customizeNewsLetters[2].thumbnail ?? 'no data',
                  title:
                  homeController.homeModel!.customizeNewsLetters[2].title,
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
                ),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            backgroundColor: AppColors.v6,
            textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.white),
            label: '퀴즈 종료',
            onPressed: () {
              Get.offAll(BottomNavigationView());
            },
          ),
        ],
      ),
    ),
  );
}

_allCorrect() {
  return SafeArea(
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
                    text: '4개 중 ',
                    style:
                        FontStyles.Headline2_b.copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: '4개 ',
                    style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
                  ),
                  TextSpan(
                    text: '다 맞혔어요!',
                    style:
                        FontStyles.Headline2_b.copyWith(color: AppColors.black),
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
              tapController.changeCurrentIndex(2);
              Get.offAll(BottomNavigationView());
            },
          ),
        ],
      ),
    ),
  );
}
