import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';

class LiveNewsScreen extends StatelessWidget {
  const LiveNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SvgPicture.asset('assets/images/newsletter_logo1.svg'),
                ),
                Expanded(
                  child: Container(),
                ), // 공간을 채우기 위한 빈 컨테이너
              ],
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0), // 오른쪽에 여백 추가
                  child: SvgPicture.asset('assets/images/newsletter_line.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    width: 77, height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.g2)),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: '실시간 ',
                          style: FontStyles.Caption2_sb.copyWith(
                              color: AppColors.g5), //기본style을 지정해줘야함
                          children: <TextSpan>[
                            TextSpan(
                              text: ' TOP1',
                              style: FontStyles.Caption2_sb.copyWith(
                                  color: AppColors.v5), //기본style을 지정해줘야함
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("테슬라 주가 갑자기\n오른 이유는?",
                          style: FontStyles.Title2_sb.copyWith(
                              color: AppColors.black)),
                      Expanded(child: Container()),
                      IconButton(
                        icon: SvgPicture.asset(
                            'assets/icons/newsletter_bookmark.svg'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.g1),
                        child: Center(
                          child: Text(
                            '미국경제',
                            style: FontStyles.Caption2_m.copyWith(
                                color: AppColors.g6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Container(
                          width: 36,
                          height: 22,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.g1),
                          child: Center(
                            child: Text(
                              '금리',
                              style: FontStyles.Caption2_m.copyWith(
                                  color: AppColors.g6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text("2024.04.25",
                              style: FontStyles.Ln1_r.copyWith(
                                  color: Colors.grey))),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        // 오른쪽에 여백 추가
                        child: Image.asset(
                          'assets/icons/newsletter_editorprofile.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Edit By. ',
                          style: FontStyles.Caption1_r.copyWith(
                              color: AppColors.g3), //기본style을 지정해줘야함
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Amy',
                              style: FontStyles.Caption1_m.copyWith(
                                  color: AppColors.g3), //기본style을 지정해줘야함
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 380,
                  height: 300,
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.g1),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                              alignment: Alignment.topCenter,
                              // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                              child: Text(
                                "두둑한 3줄 요약",
                                style: FontStyles.Heading1_b.copyWith(
                                    color: AppColors.v5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                                alignment: Alignment.topCenter,
                                // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                child: SvgPicture.asset(
                                    'assets/images/newsletter_dotori.svg')),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                                alignment: Alignment.topCenter,
                                // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                child: Text(
                                  "물가상승률이 예상보다 높아 불과 몇 주 만에\n전문가들의 미국 기준금리 인하 예상 시점이\n한참 미뤄졌음.",
                                  style: FontStyles.Ln1_m.copyWith(
                                      color: AppColors.g6),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                                alignment: Alignment.topCenter,
                                // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                child: SvgPicture.asset(
                                    'assets/images/newsletter_dotori.svg')),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                                alignment: Alignment.topCenter,
                                // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                child: Text(
                                    "급격한 기준금리 인상에도 불구하고, 미국의\n경제는 상대적으로 호황을 누리고 있음.",
                                    style: FontStyles.Ln1_m.copyWith(
                                        color: AppColors.g6))),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                                alignment: Alignment.topCenter,
                                // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                child: SvgPicture.asset(
                                    'assets/images/newsletter_dotori.svg')),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                            child: Align(
                                alignment: Alignment.topCenter,
                                // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                child: Text(
                                    "이민자 증가, 높은 고용 유연성, 인공지능(AI)\n발전 등에 따른 노동생산성 향상이 미국 경제\n호황의 대표적 요인으로 꼽히고 있음.",
                                    style: FontStyles.Ln1_m.copyWith(
                                        color: AppColors.g6))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '뉴스 전문 보기', style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                      ),
                      SizedBox(
                        width: 8,
                      )
                      ,SvgPicture.asset('assets/icons/view_more.svg')
                    ],
                  ),
                )
                ,Padding(
                  padding: const EdgeInsets.only(top: 59.0),
                  child: Text('하지만 비슷하게 긴축에 나섰던 다른 주요국들이 경제 침체\n'
                      '를 겪는 동안, 미국은 상대적으로 경제 호황을 누리고 있어\n'
                      '요. 빠른 기준금리 인상에 따라 경착륙(심한 경기 침체), 연\n'
                      '착륙(약한 경기 침체), 스태그플레이션 등 여러 침체 시나리\n'
                      '오를 제시했던 전문가들의 예상이 모두 빗나간 거예요.'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 74.0),
                  child: Text('AI 추천 정보', style: FontStyles.Headline1_b.copyWith(color: AppColors.g6),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: 328, height: 83,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: AppColors.g1,)
                    ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/live_news_company.png',width: 134, height: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('+5.74%', style: FontStyles.Headline1_m.copyWith(color: Colors.red),),
                            Text('173,300원', style: FontStyles.Label2_r.copyWith(color: AppColors.g6),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                    child: Container(
                      width: 328, height: 164,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.g1
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                        },
                        icon: Image.asset(
                          'assets/images/newsletter_think3.png',
                          width: 143,
                          height: 143,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0), // 패딩 추가
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/newsletter_invest1.png',
                            width: 143,
                            height: 143,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    width: double.infinity, height: 8,
                    decoration: BoxDecoration(
                        color: AppColors.g1
                    ),
                  ),
                )
                ,Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          16.0, 32.0, 0.0, 12.0), // 좌측으로부터 일정한 간격을 주기 위한 패딩
                      child: Text(
                        "다른 사람들의 생각은?",
                        style: FontStyles.Heading2_b.copyWith(
                            color: AppColors.g6),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Image.asset('assets/images/newsletter_blurcomment.png',width: double.infinity,)
                )
              ],
            ),
          ),
        ));
  }
}
