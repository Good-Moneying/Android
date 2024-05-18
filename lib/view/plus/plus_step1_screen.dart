import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';

class PlusStep1Screen extends StatelessWidget {
  const PlusStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      initialPage: 0,
    );
    return Scaffold(
        backgroundColor: AppColors.g1,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                  height: 480,
                  width: 330, // 페이지뷰 높이 설정
                  child: PageView(
                    controller: pageController,
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
                                              text: '안녕하세요!\n여러분의 생각 더하기를\n도와줄',
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
                                width: 238,
                                height: 177,
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
                                width: 238,
                                height: 177,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))),
          SizedBox(height: 16),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 5,
              effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: AppColors.g3,
                  activeDotColor: AppColors.v4),
            ),
          ),
        ]));
  }
}
