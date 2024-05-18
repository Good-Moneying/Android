import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../viewModel/home_viewModel.dart';

class LiveNewsScreen extends GetView<HomeViewModel> {

  @override
  Widget build(BuildContext context) {
    //final HomeViewModel controller = Get.put(HomeViewModel()); // GetX 컨트롤러를 가져옴
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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('이 ',style: FontStyles.Br2_sb),
                      SvgPicture.asset('assets/icons/editor_live.svg'),
                      SvgPicture.asset('assets/icons/editor_newthink.svg'),
                      Text(' 에 대한 생각 듣고싶어요!',style: FontStyles.Br2_sb),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/news_letter_think.png',
                      width: 143,
                      height: 143,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(
                          splashColor:
                          Colors.transparent,
                          highlightColor:
                          Colors.transparent,
                        ),
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                        StateSetter setState) {
                                      return AlertDialog(
                                        surfaceTintColor: Colors.transparent,
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(13.2),
                                        ),
                                        //insetPadding: EdgeInsets.zero,
                                        contentPadding: const EdgeInsets.only(
                                            left: 16.0, right: 16.0),
                                        title: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "내 생각 작성하기",
                                                style:
                                                FontStyles.Br2_m.copyWith(
                                                    color: AppColors.g6),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/images/newsletter_close.svg'), // 닫기 아이콘
                                            ),
                                          ],
                                        ),
                                        content: Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 1.0,
                                                width: double.infinity,
                                                color: AppColors.g2,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    0, 12.0, 0, 16),
                                                child: Text(
                                                  "뉴스레터를 읽은 후\n여러분의 생각을 자유롭게 작성해보세요!",
                                                  style: FontStyles.Bn1_m,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                  'assets/images/newsletter_line3.svg'),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        23.0, 16.0, 0.0, 16.0),
                                                    // 오른쪽에 여백 추가
                                                    child: Text(
                                                        "앞으로 어떻게 될 것 같나요?",
                                                        style: FontStyles.Br2_sb
                                                            .copyWith(
                                                            color: AppColors
                                                                .v6),
                                                        textAlign:
                                                        TextAlign.center),
                                                  ),
                                                ],
                                              ),
                                              Theme(
                                                data: ThemeData(
                                                  splashColor:
                                                  Colors.transparent,
                                                  highlightColor:
                                                  Colors.transparent,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Obx(() => InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectAgree(0);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 8.0),
                                                        child: Column(
                                                          children: [
                                                            controller
                                                                .isDialogAgreeList[0]
                                                                ? Container(
                                                              width:
                                                              90,
                                                              height:
                                                              31,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(14.6),
                                                                  color: AppColors.v1,
                                                                  border: Border.all(color: AppColors.v6)),
                                                              child:
                                                              Center(
                                                                child:
                                                                Text(
                                                                  '긍정적인 전망',
                                                                  style:
                                                                  FontStyles.Caption2_sb.copyWith(color: AppColors.v6),
                                                                ),
                                                              ),
                                                            )
                                                                : Container(
                                                              width:
                                                              90,
                                                              height:
                                                              31,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(14.6),
                                                                  border: Border.all(color: Color(0xFFAAAAB9))),
                                                              child:
                                                              Center(
                                                                child:
                                                                Text(
                                                                  '긍정적인 전망',
                                                                  style:
                                                                  FontStyles.Caption2_sb.copyWith(color: Color(0xFFAAAAB9)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                                    Obx(() => InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectAgree(1);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 8.0),
                                                        child: Column(
                                                          children: [
                                                            controller
                                                                .isDialogAgreeList[1]
                                                                ? Container(
                                                              width:
                                                              90,
                                                              height:
                                                              31,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(14.6),
                                                                  color: AppColors.v1,
                                                                  border: Border.all(color: AppColors.v6)),
                                                              child:
                                                              Center(
                                                                child:
                                                                Text(
                                                                  '부정적인 전망',
                                                                  style:
                                                                  FontStyles.Caption2_sb.copyWith(color: AppColors.v6),
                                                                ),
                                                              ),
                                                            )
                                                                : Container(
                                                              width:
                                                              90,
                                                              height:
                                                              31,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(14.6),
                                                                  border: Border.all(color: Color(0xFFAAAAB9))),
                                                              child:
                                                              Center(
                                                                child:
                                                                Text(
                                                                  '부정적인 전망',
                                                                  style:
                                                                  FontStyles.Caption2_sb.copyWith(color: Color(0xFFAAAAB9)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                                    Obx(() => InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectAgree(2);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 8.0),
                                                        child: Column(
                                                          children: [
                                                            controller
                                                                .isDialogAgreeList[2]
                                                                ? Container(
                                                              width:
                                                              90,
                                                              height:
                                                              31,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(14.6),
                                                                  color: AppColors.v1,
                                                                  border: Border.all(color: AppColors.v6)),
                                                              child:
                                                              Center(
                                                                child:
                                                                Text(
                                                                  '잘 모르겠음',
                                                                  style:
                                                                  FontStyles.Caption2_sb.copyWith(color: AppColors.v6),
                                                                ),
                                                              ),
                                                            )
                                                                : Container(
                                                              width:
                                                              90,
                                                              height:
                                                              31,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(14.6),
                                                                  border: Border.all(color: Color(0xFFAAAAB9))),
                                                              child:
                                                              Center(
                                                                child:
                                                                Text(
                                                                  '잘 모르겠음',
                                                                  style:
                                                                  FontStyles.Caption2_sb.copyWith(color: Color(0xFFAAAAB9)),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 120,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 16.0),
                                                  child: TextFormField(
                                                    keyboardType:
                                                    TextInputType.multiline,
                                                    maxLines: null,
                                                    maxLength: 200,
                                                    expands: true,
                                                    decoration: InputDecoration(
                                                        border:
                                                        OutlineInputBorder(),
                                                        hintText:
                                                        '여러분의 생각을 남겨보세요. (최대 200자)',
                                                        hintStyle: FontStyles
                                                            .Caption2_r
                                                            .copyWith(
                                                            color: AppColors
                                                                .g5),
                                                        filled: true,
                                                        fillColor:
                                                        AppColors.g1),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Obx(() => Checkbox(
                                                    activeColor:
                                                    AppColors.v5,
                                                    checkColor:
                                                    Colors.white,
                                                    value: controller
                                                        .isLookAlone.value,
                                                    onChanged: (value) {
                                                      controller
                                                          .selectLook();
                                                    },
                                                  )),
                                                  Text(
                                                    "나 혼자만 볼래요",
                                                    style: FontStyles.Label2_r
                                                        .copyWith(
                                                        color:
                                                        AppColors.g6),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "내 생각은 ‘둘러보기’에 공유될 수 있어요!",
                                                    style: FontStyles.Caption2_r
                                                        .copyWith(
                                                        color:
                                                        AppColors.g4),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 32.0),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    "시작하기",
                                                    style: FontStyles
                                                        .Caption1_sb
                                                        .copyWith(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                  style:
                                                  ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      AppColors.v6,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            50),
                                                      ),
                                                      minimumSize:
                                                      Size(286, 37)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  });
                              Get.bottomSheet(
                                SingleChildScrollView(
                                  child: Container(
                                    height: Get.height * 0.5,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 32, 16, 32),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                bottom: 6.0),
                                            child: Text(
                                              '왜 그렇게 생각하시나요?',
                                              style:
                                              FontStyles.Headline2_b
                                                  .copyWith(
                                                  color: AppColors
                                                      .black),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                bottom: 16.0),
                                            child: Text(
                                              '내 생각을 등록하면 다른 사람들 생각을 볼 수 있어요!',
                                              style: FontStyles.Caption1_m
                                                  .copyWith(
                                                  color:
                                                  AppColors.g4),
                                            ),
                                          ),
                                          Container(
                                            height: Get.height * 0.24,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: AppColors.g1,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  16.0),
                                              child: TextField(
                                                maxLength: 300,
                                                maxLines: null,
                                                textInputAction:
                                                TextInputAction.done,
                                                keyboardType:
                                                TextInputType.text,
                                                style: FontStyles
                                                    .Caption1_r
                                                    .copyWith(
                                                    color: AppColors
                                                        .black),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    hintText:
                                                    '여러분의 생각을 남겨보세요. (최대 300자)',
                                                    hintStyle: FontStyles
                                                        .Caption1_r
                                                        .copyWith(
                                                        color:
                                                        AppColors
                                                            .g5),
                                                    border:
                                                    InputBorder.none),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style:
                                            ElevatedButton.styleFrom(
                                              minimumSize:
                                              const Size.fromHeight(
                                                  50),
                                              backgroundColor:
                                              AppColors.v6,
                                            ),
                                            child: Text(
                                              '등록하기',
                                              style: FontStyles.Bn1_b
                                                  .copyWith(
                                                  color: AppColors
                                                      .white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: Container(
                              width: 328, height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.v6
                              ),
                              child: Center(
                                  child: Text(
                                    '내 생각 작성하기',style: FontStyles.Bn1_b.copyWith(color: Colors.white),
                                  )),
                            )
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
