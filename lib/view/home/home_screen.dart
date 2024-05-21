import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:meetup/design/widgets/history_widget.dart';
import 'package:meetup/design/widgets/home/editor_card.dart';
import 'package:meetup/design/widgets/home/news_slider.dart';
import 'package:meetup/design/widgets/home/recommend_box.dart';
import 'package:meetup/design/widgets/home/today_word.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/chip_editor.dart';
import '../../design/widgets/tooltip_balloon.dart';
import '../../routes/get_pages.dart';
import '../../viewModel/home_viewModel.dart';

class HomeScreen extends GetView<HomeViewModel> {
  // final userController = Get.find<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewModel());
    controller.getHomeModel();

    return Obx(
      () {
        if (controller.isLoading.value) {
          return Scaffold(
            backgroundColor: AppColors.g1,
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.v5,
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.g1,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  SvgPicture.asset('assets/icons/home_appBar.svg'),
                  Spacer(),
                  SvgPicture.asset('assets/icons/notification.svg')
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '오늘의 ',
                            style: FontStyles.Heading1_b.copyWith(
                                color: AppColors.black),
                          ),
                          TextSpan(
                            text: '뉴씽',
                            style: FontStyles.Heading1_b.copyWith(
                                color: AppColors.v6),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      '오늘의 새로운 경제 지식! 함께 생각해볼까요?',
                      style:
                          FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  //에디터 카드 위젯
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: EditorCard(
                        title: controller.homeModel?.todayNewsLetter.title ??
                            '비어있음',
                        image: controller
                                .homeModel?.todayNewsLetter.thumbnail ??
                            'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                        isBookMark: controller.isEditorBookMark.value,
                        onEditor: () {
                          controller.isEditorBookMark.value
                              ? controller.isEditorBookMark.value = false
                              : controller.isEditorBookMark.value = true;
                        },
                      ),
                    ),
                  ),
                  //에디터 카드
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  //실시간 트렌드 뉴스
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                        GestureDetector(
                          onTap: () {
                            final format = DateTime.parse(controller
                                .homeModel!.todayNewsLetter.createdAt);
                            print('formatdate 테스트');
                            print(format);
                            print(controller.formatDate(format));

                            Get.toNamed(Routes.ALLLIVE);
                          },
                          child: Row(
                            children: [
                              Text(
                                '전체보기',
                                style: FontStyles.Caption1_m.copyWith(
                                    color: AppColors.g4),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: SvgPicture.asset(
                                    'assets/icons/view_more.svg'),
                              ),
                            ],
                          ),
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
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
                    () => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RecommendU(
                        image: controller
                                .homeModel?.customizeNewsLetters[0].thumbnail ??
                            'no data',
                        title:
                            controller.homeModel!.customizeNewsLetters[0].title,
                        isRecommend: controller.isRecommendFirst.value,
                        onRecommend: () {
                          controller.isRecommendFirst.value
                              ? controller.isRecommendFirst.value = false
                              : controller.isRecommendFirst.value = true;
                        },
                        tag: CustomChip(label: controller.parseCustom1()[0],),
                        history: History(
                          diff: controller.formatDate(
                            DateTime.parse(controller
                                .homeModel!.customizeNewsLetters[0].createdAt),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RecommendU(
                        image: controller
                                .homeModel?.customizeNewsLetters[1].thumbnail ??
                            'no data',
                        title:
                            controller.homeModel!.customizeNewsLetters[1].title,
                        tag: CustomChip(label: controller.parseCustom1()[1],),
                        isRecommend: controller.isRecommendSecond.value,
                        onRecommend: () {
                          controller.isRecommendSecond.value
                              ? controller.isRecommendSecond.value = false
                              : controller.isRecommendSecond.value = true;
                        },
                        history: History(
                          diff: controller.formatDate(
                            DateTime.parse(controller
                                .homeModel!.customizeNewsLetters[1].createdAt),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RecommendU(
                        image: controller
                                .homeModel?.customizeNewsLetters[2].thumbnail ??
                            'no data',
                        title:
                            controller.homeModel!.customizeNewsLetters[2].title,
                        tag: CustomChip(label: controller.parseCustom1()[2],),
                        isRecommend: controller.isRecommendThird.value,
                        onRecommend: () {
                          controller.isRecommendThird.value
                              ? controller.isRecommendThird.value = false
                              : controller.isRecommendThird.value = true;
                        },
                        history: History(
                          diff: controller.formatDate(
                            DateTime.parse(controller
                                .homeModel!.customizeNewsLetters[2].createdAt),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  //오늘의 단어
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
                                style: FontStyles.Caption1_m.copyWith(
                                    color: AppColors.g4),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: SvgPicture.asset(
                                    'assets/icons/view_more.svg'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Padding(
                      //padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                      child: TodayWord(
                        title: controller.homeModel?.todayTerm.koreanName ??
                            'no data',
                        engTitle: controller.homeModel?.todayTerm.englishName ??
                            'no data',
                        meaning: controller.homeModel?.todayTerm.description ??
                            'no data',
                        category: controller.homeModel?.todayTerm.category ??
                            'no data',
                        isBookMark: controller.isWordBookMark.value,
                        onBookMark: () {
                          controller.isWordBookMark.value
                              ? controller.isWordBookMark.value = false
                              : controller.isWordBookMark.value = true;

                          if (controller.isWordBookMark.value) {
                            controller.archives(
                                'TERM', controller.homeModel!.todayTerm.termId);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
