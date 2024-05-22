import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:meetup/viewModel/plus_onBoarding_viewModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../viewModel/plus_home_viewModel.dart';

class PlusOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plusOnBoarding = Get.put(PlusOnBoardingViewModel());
    final plusHomeController = Get.put(PlusHomeViewModel());
    final PageController pageControllerOnBoarding =
        PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Stack(children: [
                Container(
                  height: 550,
                  width: 378, // 페이지뷰 높이 설정
                  child: PageView(
                    controller: pageControllerOnBoarding,
                    onPageChanged: (index) {
                      plusOnBoarding.currentPageIndex.value = index; // 페이지 인덱스 업데이트
                    },
                    children: [
                      // 첫 번째 페이지
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.v2, // 바깥쪽 Container의 배경색
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 72.0),
                                child: Container(
                                  width: 220,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          AppColors.white // 안쪽 Container의 배경색
                                      ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            // 가운데 정렬
                                            text: TextSpan(
                                              text:
                                                  '안녕하세요!\n여러분의 생각 더하기를\n도와줄 ',
                                              style: FontStyles.Ln1_m.copyWith(
                                                  color: AppColors.g6),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '구르미',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.v5),
                                                ),
                                                TextSpan(
                                                  text: '에요',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.g6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/icons/plus_cloudfun.png',
                                width: 330,
                                height: 230,
                              )
                            ],
                          ),
                        ),
                      ),
                      // 두 번째 페이지
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.v2, // 바깥쪽 Container의 배경색
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 72.0),
                                child: Container(
                                  width: 220,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          AppColors.white // 안쪽 Container의 배경색
                                      ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            // 가운데 정렬
                                            text: TextSpan(
                                              text: '생각더하기가 처음이신\n',
                                              style: FontStyles.Ln1_m.copyWith(
                                                  color: AppColors.g6),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '여러분께 어떻게 생각을 더할지\n',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.g6),
                                                ),
                                                TextSpan(
                                                  text: '도와드릴게요!',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.g6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/icons/plus_cloudfun2.png',
                                width: 330,
                                height: 230,
                              )
                            ],
                          ),
                        ),
                      ),
                      // 세 번째 페이지딩
                      Container(
                        width: 378, // 상위 컨테이너의 너비 설정
                        height: 550,
                        child: Stack(
                          children: [
                            // 바깥 보라색 컨테이너
                            Positioned(
                              top: 0,
                              child: Container(
                                width: 378,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(17),
                                    topRight: Radius.circular(17),
                                  ),
                                  color: AppColors.v2,
                                  border: Border.all(color: AppColors.v1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Container(
                                    width: 270,
                                    height: 106,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.white,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              text:
                                                  '작성하신 나의 생각을 요약해봤어요!\n나의 생각에 ',
                                              style: FontStyles.Ln1_m.copyWith(
                                                  color: AppColors.g6),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '“왜?”라는 질문',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.v5),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '을 해보며\n생각의 핵심을 찾아 떠나봐요.',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.g6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // 아래 흰색 컨테이너들
                            Positioned(
                              top: 220,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17),
                                  ),
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.v1),
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                          child: Container(
                                            width: 261,
                                            height: 101,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: AppColors.v2),
                                            ),
                                            child: Center(
                                              child: Text('테슬라'),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 35,
                                          left: 114,
                                          child: Image.asset(
                                            'assets/icons/plus_icon1.png',
                                            width: 32,
                                            height: 32,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Container(
                                        width: 261,
                                        height: 47,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: AppColors.v5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '테슬라의 기술 혁신',
                                            style: FontStyles.Ln1_sb.copyWith(
                                                color: AppColors.v6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 네 번째 페이지
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.v2, // 바깥쪽 Container의 배경색
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 72.0),
                                child: Container(
                                  width: 220,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          AppColors.white // 안쪽 Container의 배경색
                                      ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            // 가운데 정렬
                                            text: TextSpan(
                                              text: '여러분이 생각을 더 할 수록\n',
                                              style: FontStyles.Ln1_m.copyWith(
                                                  color: AppColors.g6),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '구르미가 함께 성장해 나간답니다!',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.g6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/icons/plus_cloud.png',
                                width: 350,
                                height: 250,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.v2, // 바깥쪽 Container의 배경색
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 72.0),
                                child: Container(
                                  width: 220,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          AppColors.white // 안쪽 Container의 배경색
                                      ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            // 가운데 정렬
                                            text: TextSpan(
                                              text: '자! 그럼 저와 함께\n',
                                              style: FontStyles.Ln1_m.copyWith(
                                                  color: AppColors.g6),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '‘생각 더하기’를 시작해봐요!',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color: AppColors.g6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/icons/plus_cloudfun3.png',
                                width: 350,
                                height: 250,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 16),
            Center(
              child: SmoothPageIndicator(
                controller: pageControllerOnBoarding,
                count: 5,
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: AppColors.g3,
                    activeDotColor: AppColors.v4),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                plusOnBoarding.nextPage(); // 뷰 모델의 nextPage 메서드 호출
                pageControllerOnBoarding.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                ); // 페이지 컨트롤러를 통해 페이지 변경
              },
              child: Container(
                width: 290,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.v6),
                child: Center(
                    child: Text(
                  '다음',
                  style: FontStyles.Ln1_sb.copyWith(color: AppColors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
