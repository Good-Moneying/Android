import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/view/bottomNavigationBar.dart';

import '../../../design/style/ColorStyles.dart';
import '../../../design/style/FontStyles.dart';
import '../../../design/widgets/appBar/back_appBar.dart';
import '../../../design/widgets/home/news_slider.dart';
import '../../../design/widgets/home/recommend_box.dart';
import '../../../design/widgets/progress_bar.dart';
import '../../../routes/get_pages.dart';

class ResultQuizScreen extends StatelessWidget {
  const ResultQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black, title: null,),
      body: _allCorrect(),
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
                    text: '8개 중 ',
                    style: FontStyles.Headline2_b.copyWith(
                        color: AppColors.black),
                  ),
                  TextSpan(
                    text: '3개',
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
                RecommendU(
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
                RecommendU(
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
                    text: '8개 중 ',
                    style:
                        FontStyles.Headline2_b.copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: '8개 ',
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
              Get.offAll(BottomNavigationView());
            },
          ),
        ],
      ),
    ),
  );
}
