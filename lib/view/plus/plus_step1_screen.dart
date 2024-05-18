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
                  height: 230,
                  width: 270, // 페이지뷰 높이 설정
                  child: PageView(
                    controller: pageController,
                    children: [
                      // 첫 번째 페이지
                      Container(
                        width: 270, height: 230,
                        child: Stack(
                          children: [
                            Positioned(child: Container(
                              width: 270, height: 150
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(17) ,topRight: Radius.circular(17)), color: AppColors.v2,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/plus_cloud1.png', width: 163, height: 98,),
                                  Text('Lv.1', style: FontStyles.Label2_sb.copyWith(color: AppColors.white),)
                                ],
                              ),
                            )),
                            Positioned(
                              top: 150
                                ,child: Container(
                              width: 270, height: 80
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17) ,bottomRight: Radius.circular(17)), color: AppColors.white,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('테슬라의 기술 혁신', style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                      // 두 번째 페이지
                      Container(
                        width: 270, height: 230,
                        child: Stack(
                          children: [
                            Positioned(child: Container(
                              width: 270, height: 150
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(17) ,topRight: Radius.circular(17)), color: AppColors.v2,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/plus_cloud1.png', width: 163, height: 98,),
                                  Text('Lv.2', style: FontStyles.Label2_sb.copyWith(color: AppColors.white),)
                                ],
                              ),
                            )),
                            Positioned(
                                top: 150
                                ,child: Container(
                              width: 270, height: 80
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17) ,bottomRight: Radius.circular(17)), color: AppColors.white,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('테슬라의 기술 혁신', style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: 270, height: 230,
                        child: Stack(
                          children: [
                            Positioned(child: Container(
                              width: 270, height: 150
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(17) ,topRight: Radius.circular(17)), color: AppColors.v2,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/plus_cloud1.png', width: 163, height: 98,),
                                  Text('Lv.1', style: FontStyles.Label2_sb.copyWith(color: AppColors.white),)
                                ],
                              ),
                            )),
                            Positioned(
                                top: 150
                                ,child: Container(
                              width: 270, height: 80
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17) ,bottomRight: Radius.circular(17)), color: AppColors.white,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('테슬라의 기술 혁신', style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: 270, height: 230,
                        child: Stack(
                          children: [
                            Positioned(child: Container(
                              width: 270, height: 150
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(17) ,topRight: Radius.circular(17)), color: AppColors.v2,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/plus_cloud1.png', width: 163, height: 98,),
                                  Text('Lv.1', style: FontStyles.Label2_sb.copyWith(color: AppColors.white),)
                                ],
                              ),
                            )),
                            Positioned(
                                top: 150
                                ,child: Container(
                              width: 270, height: 80
                              ,decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17) ,bottomRight: Radius.circular(17)), color: AppColors.white,
                                border: Border.all(color: AppColors.v1)
                            ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('테슬라의 기술 혁신', style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ))),
          SizedBox(height: 16),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: AppColors.g3,
                  activeDotColor: AppColors.v5),
            ),
          ),
        ]));
  }
}
