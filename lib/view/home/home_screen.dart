import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/chip_editor.dart';
import 'package:meetup/design/widgets/history_widget.dart';
import 'package:meetup/design/widgets/recommend_box.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/tooltip_balloon.dart';
import '../../routes/get_pages.dart';
import 'news_letter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indicatorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        title: Text('홈화면입니다.'),
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
              Card(
                color: AppColors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            //임시 사진
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                              height: Get.height * 0.25,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 13,
                            right: 16,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: AppColors.white.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                ),
                                SvgPicture.asset(
                                    'assets/icons/bookmark_unfill.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          '테슬라 주가 갑자기 오른 이유는?',
                          style: FontStyles.Headline2_b.copyWith(
                              color: AppColors.black),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomChip(label: '미국경제'),
                          CustomChip(label: '금리'),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10),
                            child: History(),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                    setState(() {
                      _indicatorIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: _indicatorIndex,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.g5,
                      dotColor: AppColors.g3,
                      dotHeight: 6,
                      dotWidth: 6,
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
              Card(
                color: AppColors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            '테슬라 요건',
                            style:
                                FontStyles.Bn1_b.copyWith(color: AppColors.v6),
                          ),
                          CustomChip(label: '기업'),
                          Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                    color: AppColors.g2.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                  'assets/icons/bookmark_unfill.svg'),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Tesla’s requirements',
                        style: FontStyles.Ln1_m.copyWith(color: AppColors.g3),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      //뜻
                      RichText(
                        maxLines: 3,
                        softWrap: true,
                        text: TextSpan(
                          text:
                              '주식 시장에 상장하기 위한 요건을 갖추기 못한 기업들 중에서 잠재력이 큰 곳들을 골라 상장 기회를 주는 제도에요!',
                          style: FontStyles.Bn1_r.copyWith(
                              color: AppColors.g5, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
