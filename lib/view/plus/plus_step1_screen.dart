import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/icons/plus_say.svg'),
                Positioned(
                    child: Text('왜 발생했을지 곰곰히 생각해보자!', style: FontStyles.Caption1_sb.copyWith(color: AppColors.g6),textAlign: TextAlign.center,)),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                    height: 230,
                    width: 270, // 페이지뷰 높이 설정
                    child: PageView(
                      controller: pageController,
                      children: [
                        // 첫 번째 페이지
                        Container(
                          width: 270,
                          height: 230,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                width: 270,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(17),
                                        topRight: Radius.circular(17)),
                                    color: AppColors.v2,
                                    border: Border.all(color: AppColors.v1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/plus_cloud1.png',
                                      width: 163,
                                      height: 98,
                                    ),
                                    Text(
                                      'Lv.1',
                                      style: FontStyles.Label2_sb.copyWith(
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                              )),
                              Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 270,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)),
                                        color: AppColors.white,
                                        border: Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '테슬라의 기술 혁신',
                                          style: FontStyles.Ln1_sb.copyWith(
                                              color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        // 두 번째 페이지
                        Container(
                          width: 270,
                          height: 230,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                width: 270,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(17),
                                        topRight: Radius.circular(17)),
                                    color: AppColors.v2,
                                    border: Border.all(color: AppColors.v1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/plus_cloud2.png',
                                      width: 163,
                                      height: 98,
                                    ),
                                    Text(
                                      'Lv.2',
                                      style: FontStyles.Label2_sb.copyWith(
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                              )),
                              Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 270,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)),
                                        color: AppColors.white,
                                        border: Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '테슬라의 기술 혁신',
                                          style: FontStyles.Ln1_sb.copyWith(
                                              color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: 270,
                          height: 230,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                width: 270,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(17),
                                        topRight: Radius.circular(17)),
                                    color: AppColors.v2,
                                    border: Border.all(color: AppColors.v1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/plus_cloud3.png',
                                      width: 163,
                                      height: 98,
                                    ),
                                    Text(
                                      'Lv.3',
                                      style: FontStyles.Label2_sb.copyWith(
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                              )),
                              Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 270,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)),
                                        color: AppColors.white,
                                        border: Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '테슬라의 기술 혁신',
                                          style: FontStyles.Ln1_sb.copyWith(
                                              color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: 270,
                          height: 230,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                width: 270,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(17),
                                        topRight: Radius.circular(17)),
                                    color: AppColors.v2,
                                    border: Border.all(color: AppColors.v1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/plus_cloud4.png',
                                      width: 163,
                                      height: 98,
                                    ),
                                    Text(
                                      'Lv.4',
                                      style: FontStyles.Label2_sb.copyWith(
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                              )),
                              Positioned(
                                  top: 150,
                                  child: Container(
                                    width: 270,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)),
                                        color: AppColors.white,
                                        border: Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '테슬라의 기술 혁신',
                                          style: FontStyles.Ln1_sb.copyWith(
                                              color: AppColors.black),
                                        ),
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: 328, height: 283,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: AppColors.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('생각더하기', style: FontStyles.Headline2_b.copyWith(color: AppColors.black),),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: SvgPicture.asset('assets/icons/plus_info.svg'),
                          ),
                          Spacer()
                          ,Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Container(
                              width: 79, height: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7), color: AppColors.g5
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('요약하기', style: FontStyles.Caption2_sb.copyWith(color: AppColors.white),),
                                  SvgPicture.asset('assets/icons/plus_summary.svg')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: 296, height: 150,
                        child: TextFormField(
                          keyboardType:
                          TextInputType.multiline,
                          maxLines: null,
                          maxLength: 100,
                          expands: true,
                          decoration: InputDecoration(
                              hintText:
                              '작성하고 꼭! 요약하기를 실행해주세요. (최대 100자)',
                              hintStyle: FontStyles
                                  .Caption2_r
                                  .copyWith(
                                  color: AppColors
                                      .g5),
                              filled: true,
                              fillColor:
                              AppColors.g1,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        width: 290, height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), color: AppColors.v6
                        ),
                        child: Center(child: Text('등록하기', style: FontStyles.Ln1_sb.copyWith(color: AppColors.white),)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}