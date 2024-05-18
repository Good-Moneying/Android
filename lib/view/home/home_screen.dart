import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meetup/design/widgets/home/editor_card.dart';
import 'package:meetup/design/widgets/home/news_slider.dart';
import 'package:meetup/design/widgets/home/recommend_box.dart';
import 'package:meetup/design/widgets/home/today_word.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/tooltip_balloon.dart';
import '../../routes/get_pages.dart';
import '../../viewModel/home_viewModel.dart';

class HomeScreen extends GetView<HomeViewModel> {
 // final userController = Get.find<UserViewModel>();


  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewModel());
    controller.getHomeModel();

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        title: Text('홈화면'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '오늘의 ',
                      style: FontStyles.Heading1_b.copyWith(
                          color: AppColors.black),
                    ),
                    TextSpan(
                      text: '뉴씽',
                      style:
                          FontStyles.Heading1_b.copyWith(color: AppColors.v6),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                '오늘의 새로운 경제 지식! 함께 생각해볼까요?',
                style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              //에디터 카드 위젯
              Obx(
                () => EditorCard(
                  title: controller.homeModel?.todayNewsLetter.title ?? '비어있음',
                  image:
                       // controller.homeModel?.todayNewsLetter.thumbnail
                       //    ??
                      'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                  isBookMark: controller.isEditorBookMark.value,
                  onEditor: () {
                    controller.isEditorBookMark.value
                        ? controller.isEditorBookMark.value = false
                        : controller.isEditorBookMark.value = true;
                  },
                ),
              ),
              //에디터 카드
              SizedBox(
                height: Get.height * 0.05,
              ),
              //실시간 트렌드 뉴스
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '실시간 ',
                            style: FontStyles.Headline2_b.copyWith(
                                color: AppColors.v6),
                          ),
                          TextSpan(
                            text: '트렌드 뉴스',
                            style: FontStyles.Headline2_b.copyWith(
                                color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Tooltip(
                      message: '실시간 뉴스를 빠르게 \n핵심만 전달드릴게요!',
                      textStyle: FontStyles.Caption2_r.copyWith(
                          color: AppColors.v6),
                      decoration: ShapeDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.v1.withOpacity(0.95),
                        shape: ToolTipBalloon(),
                      ),
                      triggerMode: TooltipTriggerMode.tap,
                      child: SvgPicture.asset('assets/icons/info.svg'),
                    ),
                    Spacer(),
                    Text(
                      '전체보기',
                      style:
                          FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: SvgPicture.asset('assets/icons/view_more.svg'),
                    ),
                  ],
                ),
              ),
              Obx(() => newsSlider()),
              newsIndicator(),
              SizedBox(
                height: Get.height * 0.05,
              ),
              //추천 뉴스
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          //닉네임 들어갈 부분
                          /*TextSpan(
                            text: userController.nicknameController.value.text,
                            style: FontStyles.Headline2_b.copyWith(
                                color: AppColors.v6),
                          ),*/
                          TextSpan(
                            text: '님에게 추천해요!',
                            style: FontStyles.Headline2_b.copyWith(
                                color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Tooltip(
                      message: '관심있는 주제 및 나이, 성별에 따른 \n뉴스레터를 추천해드려요!',
                      textStyle: FontStyles.Caption2_r.copyWith(
                          color: AppColors.v6),
                      decoration: ShapeDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.v1.withOpacity(0.95),
                        shape: ToolTipBalloon(),
                      ),
                      triggerMode: TooltipTriggerMode.tap,
                      child: SvgPicture.asset('assets/icons/info.svg'),
                    ),
                  ],
                ),
              ),
              Obx(
                () => RecommendU(
                  image:
                      'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                  title: controller.homeModel!.customizeNewsLetters[0].title,
                  tag: '코인',
                  isRecommend: controller.isRecommendFirst.value,
                  onRecommend: () {
                    controller.isRecommendFirst.value
                        ? controller.isRecommendFirst.value = false
                        : controller.isRecommendFirst.value = true;
                  },
                ),
              ),
              Obx(
                () => RecommendU(
                  image:
                      'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                  title: controller.homeModel!.customizeNewsLetters[1].title,
                  tag: '주식',
                  isRecommend: controller.isRecommendSecond.value,
                  onRecommend: () {
                    controller.isRecommendSecond.value
                        ? controller.isRecommendSecond.value = false
                        : controller.isRecommendSecond.value = true;
                  },
                ),
              ),
              Obx(
                () => RecommendU(
                  image:
                      'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                  title: controller.homeModel!.customizeNewsLetters[2].title,
                  tag: '금리',
                  isRecommend: controller.isRecommendThird.value,
                  onRecommend: () {
                    controller.isRecommendThird.value
                        ? controller.isRecommendThird.value = false
                        : controller.isRecommendThird.value = true;
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              //오늘의 단어
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Text(
                      '오늘의 단어',
                      style: FontStyles.Headline2_b.copyWith(
                          color: AppColors.black),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.TODAYTERM);
                      },
                      child: Row(
                        children: [
                          Text(
                            '전체보기',
                            style:
                            FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: SvgPicture.asset('assets/icons/view_more.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => TodayWord(
                  title: controller.homeModel?.todayTerm.koreanName ?? '비어있음',
                  engTitle: controller.homeModel?.todayTerm.englishName ?? '비어있음',
                  meaning: controller.homeModel?.todayTerm.description ?? '비어있음',
                  category: controller.homeModel?.todayTerm.category ?? '비어있음',
                  isBookMark: controller.isWordBookMark.value,
                  onBookMark: () {
                    controller.isWordBookMark.value
                        ? controller.isWordBookMark.value = false
                        : controller.isWordBookMark.value = true;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}