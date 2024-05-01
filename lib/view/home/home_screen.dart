import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/chip_editor.dart';
import 'package:meetup/design/widgets/recommend_box.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/tooltip_balloon.dart';

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
              SizedBox(
                height: Get.height* 0.02,
              ),
              //에디터 카드 위젯 만들기
              Card(
                color: AppColors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      ),
                      //임시 사진
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                        height: Get.height * 0.2,
                        width: Get.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomChip(label: '미국경제'),
                          CustomChip(label: '금리'),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(
                        '테슬라 주가 갑자기 오른 이유는?',
                        style: FontStyles.Heading2_sb.copyWith(
                            color: AppColors.black),
                      ),
                      subtitle: Text(
                        '“코인 급등 랠리?” 도지코인 거래 급감',
                        style:
                            FontStyles.Caption1_m.copyWith(color: AppColors.g5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: OutlinedButton(
                        onPressed: () {
                          //에디터 화면 넘어가게하기
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          side: BorderSide(
                            color: AppColors.v2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '금융 지식 자세히 보기',
                          style:
                              FontStyles.Ln1_sb.copyWith(color: AppColors.v4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //에디터 카드
              SizedBox(
                height: Get.height * 0.03,
              ),
              Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: AppColors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
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
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      RecommendU(),
                      RecommendU(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height*0.02,
              ),
              Row(
                children: [
                  Text(
                    '실시간 트렌드 뉴스',
                    style:
                        FontStyles.Headline2_b.copyWith(color: AppColors.black),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Tooltip(
                    message: '실시간 뉴스를 빠르게 \n핵심만 전달드릴게요!',
                    textStyle:
                        FontStyles.Caption2_r.copyWith(color: AppColors.white),
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
              ElevatedButton(
                onPressed: () {
                  //Get.toNamed(Routes.INTEREST);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: AppColors.v5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //단어
                      Text(
                        '테슬라 요건',
                        style: FontStyles.Bn1_b.copyWith(color: AppColors.v7),
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
                          style: FontStyles.Caption1_m.copyWith(
                              color: AppColors.g6),
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
