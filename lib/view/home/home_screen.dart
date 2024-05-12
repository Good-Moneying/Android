import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/chip_editor.dart';
import 'package:meetup/design/widgets/history_widget.dart';
import 'package:meetup/design/widgets/home/editor_card.dart';
import 'package:meetup/design/widgets/home/recommend_box.dart';
import 'package:meetup/design/widgets/home/today_word.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/tooltip_balloon.dart';
import '../../routes/get_pages.dart';
import '../../viewModel/home_viewModel.dart';

class HomeScreen extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewModel());
    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        title: Text('홈화면'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
                      text: '두둑',
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
                '오늘의 경제 지식! 두둑하게 챙겨가세요',
                style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              //에디터 카드 위젯 만들기
              EditorCard(
                title: 'title',
                image:
                    'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                isBookMark: controller.isEditorBookMark.value,
                onEditor: () {
                controller.isEditorBookMark.value
                    ? controller.isEditorBookMark.value = false
                    : controller.isEditorBookMark.value = true;

                print(controller.isEditorBookMark.value);
              },
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
                          color: AppColors.white),
                      decoration: ShapeDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.g4.withOpacity(0.95),
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
              CarouselSlider(
                items: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        //임시 사진
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                          height: Get.height * 0.16,
                          width: Get.width * 0.6,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          height: Get.height * 0.16,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.bottomCenter,
                                  end: FractionalOffset.topCenter,
                                  colors: [
                                Color(0xFF212121),
                                Color(0xFF212121).withOpacity(0.1),
                              ])),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Text(
                          '1',
                          style: FontStyles.Title1_b.copyWith(
                              color: AppColors.white),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 30,
                        child: Text(
                          '“코인 급등 랠리?”\n도지코인 거래 급감',
                          style: FontStyles.Lr1_sb.copyWith(
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        //임시 사진
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                          height: Get.height * 0.16,
                          width: Get.width * 0.6,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          height: Get.height * 0.16,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.bottomCenter,
                                  end: FractionalOffset.topCenter,
                                  colors: [
                                Color(0xFF212121),
                                Color(0xFF212121).withOpacity(0.1),
                              ])),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Text(
                          '2',
                          style: FontStyles.Title1_b.copyWith(
                              color: AppColors.white),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 30,
                        child: Text(
                          '“코인 급등 랠리?”\n도지코인 거래 급감',
                          style: FontStyles.Lr1_sb.copyWith(
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        //임시 사진
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                          height: Get.height * 0.16,
                          width: Get.width * 0.6,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          height: Get.height * 0.16,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.bottomCenter,
                                  end: FractionalOffset.topCenter,
                                  colors: [
                                Color(0xFF212121),
                                Color(0xFF212121).withOpacity(0.1),
                              ])),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Text(
                          '3',
                          style: FontStyles.Title1_b.copyWith(
                              color: AppColors.white),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 30,
                        child: Text(
                          '“코인 급등 랠리?”\n도지코인 거래 급감',
                          style: FontStyles.Lr1_sb.copyWith(
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ],
                options: CarouselOptions(
                  height: Get.height * 0.18,
                  autoPlay: true,
                  viewportFraction: 0.7,
                  onPageChanged: (index, reason) {
                    controller.indicatorIndex.value = index;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => AnimatedSmoothIndicator(
                      activeIndex: controller.indicatorIndex.value,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.g5,
                        dotColor: AppColors.g3,
                        dotHeight: 6,
                        dotWidth: 6,
                      ),
                    ),
                  ),
                ],
              ),
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
                          TextSpan(
                            text: '두식이',
                            style: FontStyles.Headline2_b.copyWith(
                                color: AppColors.v6),
                          ),
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
                          color: AppColors.white),
                      decoration: ShapeDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.g4.withOpacity(0.95),
                        shape: ToolTipBalloon(),
                      ),
                      triggerMode: TooltipTriggerMode.tap,
                      child: SvgPicture.asset('assets/icons/info.svg'),
                    ),
                  ],
                ),
              ),
              RecommendU(),
              RecommendU(),
              RecommendU(),
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
              Obx(
                () => TodayWord(
                  title: 'title',
                  engTitle: 'engTitle',
                  meaning: 'meaning',
                  isBookMark: controller.isWordBookMark.value,
                  onBookMark: () {
                    controller.isWordBookMark.value
                        ? controller.isWordBookMark.value = false
                        : controller.isWordBookMark.value = true;

                    print(controller.isWordBookMark.value);
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
