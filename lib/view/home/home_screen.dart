import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              //에디터 카드 위젯 만들기

              Row(
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
                  GestureDetector(
                    onTap: () {
                      //SpeechBalloon(comment: '관심있는 주제 및 나이, 성별에 따른 뉴스레터를 추천해드려요!');
                    },
                    child: SvgPicture.asset('assets/icons/info.svg'),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // Row(
              //   children: [
              //     SvgPicture.asset('assets/icons/arrow_right.svg'),
              //     const Column(
              //       children: [
              //
              //         Text('제목 들어가'),
              //         Text('5분전'),
              //
              //       ],
              //     ),
              //   ],
              // ),
              Text(
                '실시간 트렌드 뉴스',
                style: FontStyles.Headline2_b.copyWith(color: AppColors.black),
              ),
              ElevatedButton(
                onPressed: () {
                  //Get.toNamed(Routes.INTEREST);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppColors.v5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Row(
                  children: [
                    Text(
                      '실시간 트렌드 더 알아보기',
                      style: FontStyles.Bn2_m.copyWith(color: AppColors.white),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/arrow_right.svg'),
                  ],
                ),
              ),
              Text(
                '오늘의 단어',
                style: FontStyles.Headline2_b.copyWith(color: AppColors.black),
              ),
              Card(
                color: AppColors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //단어
                      Text(
                        '테슬라 요건',
                        style: FontStyles.Bn1_b.copyWith(color: AppColors.v7),
                      ),
                      SizedBox(
                        height: Get.height*0.01,
                      ),
                      //뜻
                      RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: '주식 시장에 상장하기 위한 요건을 갖추기 못한 기업들 중에서 잠재력이 큰 곳들을 골라 상장 기회를 주는 제도에요!',
                          style:
                              FontStyles.Caption1_m.copyWith(color: AppColors.g6),
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
