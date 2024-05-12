import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';

import '../../viewModel/home_viewModel.dart';

class NewsLetterScreen extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                            style:
                                FontStyles.Ln1_r.copyWith(color: Colors.grey))),
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
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(17.0, 20.0, 0.0, 0.0),
                        child: Text(
                          "불과 몇 주 사이에 미국 통화 정책을 바라보는 분위기가 완\n전히 바뀌었어요. 얼마 전까진 다들 ‘올해 6월에 금리 인하\n가 시작될 것’이라고 했는데, 이젠 ‘아직 멀었다’는 사람이 많\n아졌죠.\n",
                          style: FontStyles.Ln1_r,
                        )),
                    Text(
                        "지난 16일(현지시간) 제롬 파월 미국 연방준비제도(Fed·연\n준) 의장은 사실상 6월 금리 인하가 무산됐음을 인정했어\n요. 파월 의장은 “최근 데이터는 (금리 인하에 대한) 확신을\n주지 못했고, 그런 확신을 얻는 데에는 예상보다 더 오랜 시\n간이 걸릴 것”이라고 말했어요.",
                        style: FontStyles.Ln1_r.copyWith(color: Colors.black)),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                        child: Container(
                          width: 328,
                          height: 164,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.g1),
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(17.0, 20.0, 0.0, 0.0),
                        child: Text(
                          "이제 미국의 기준금리 인하는 9월 이후에 가능하다는 전망\n이 우세하고, 인하 시점을 내년으로 보는 사람도 꽤 많아졌\n어요. 오히려 기준금리를 지금보다 조금 더 올릴 수 있다는\n전망까지 나오고 있어요.\n",
                          style: FontStyles.Ln1_r,
                        )),
                    Text(
                        "왜 갑자기 분위기가 바뀐 걸까요? 경제 전문가들이 대부분\n이런 변화를 예상하지 못했던 이유는 뭘까요?",
                        style: FontStyles.Ln1_r),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                        child: Container(
                          width: 328,
                          height: 164,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.g1),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return AlertDialog(
                                        surfaceTintColor: Colors.transparent,
                                        backgroundColor: AppColors.white,
                                        insetPadding: EdgeInsets.zero,
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
                                                        style:
                                                            FontStyles.Lr1_sb,
                                                        textAlign:
                                                            TextAlign.center),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Obx(() => InkWell(
                                                        onTap: () {
                                                          controller
                                                              .selectAgree(0);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            controller
                                                                    .isDialogAgreeList[0]
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                14.6),
                                                                        color: AppColors
                                                                            .v1,
                                                                        border: Border.all(
                                                                            color:
                                                                                AppColors.v6)),
                                                                    child: Text(
                                                                      '긍정적인 전망',
                                                                      style: FontStyles
                                                                              .Caption2_sb
                                                                          .copyWith(
                                                                              color: AppColors.v6),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                14.6),
                                                                        color: AppColors
                                                                            .g3,
                                                                        border: Border.all(
                                                                            color:
                                                                                Color(0xFFAAAAB9))),
                                                                    child: Text(
                                                                      '긍정적인 전망',
                                                                      style: FontStyles
                                                                              .Caption2_sb
                                                                          .copyWith(
                                                                              color: Color(0xFFAAAAB9)),
                                                                    ),
                                                                  )
                                                          ],
                                                        ),
                                                      )),
                                                  Obx(() => InkWell(
                                                        onTap: () {
                                                          controller
                                                              .selectAgree(1);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            controller
                                                                    .isDialogAgreeList[1]
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                14.6),
                                                                        color: AppColors
                                                                            .v1,
                                                                        border: Border.all(
                                                                            color:
                                                                                AppColors.v6)),
                                                                    child: Text(
                                                                      '부정적인 전망',
                                                                      style: FontStyles
                                                                              .Caption2_sb
                                                                          .copyWith(
                                                                              color: AppColors.v6),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                14.6),
                                                                        color: AppColors
                                                                            .g3,
                                                                        border: Border.all(
                                                                            color:
                                                                                Color(0xFFAAAAB9))),
                                                                    child: Text(
                                                                      '부정적인 전망',
                                                                      style: FontStyles
                                                                              .Caption2_sb
                                                                          .copyWith(
                                                                              color: Color(0xFFAAAAB9)),
                                                                    ),
                                                                  )
                                                          ],
                                                        ),
                                                      )),
                                                  Obx(() => InkWell(
                                                        onTap: () {
                                                          controller
                                                              .selectAgree(2);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            controller
                                                                    .isDialogAgreeList[2]
                                                                ? Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                14.6),
                                                                        color: AppColors
                                                                            .v1,
                                                                        border: Border.all(
                                                                            color:
                                                                                AppColors.v6)),
                                                                    child: Text(
                                                                      '잘 모르겠음',
                                                                      style: FontStyles
                                                                              .Caption2_sb
                                                                          .copyWith(
                                                                              color: AppColors.v6),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                14.6),
                                                                        color: AppColors
                                                                            .g3,
                                                                        border: Border.all(
                                                                            color:
                                                                                Color(0xFFAAAAB9))),
                                                                    child: Text(
                                                                      '잘 모르겠음',
                                                                      style: FontStyles
                                                                              .Caption2_sb
                                                                          .copyWith(
                                                                              color: Color(0xFFAAAAB9)),
                                                                    ),
                                                                  )
                                                          ],
                                                        ),
                                                      ))
                                                ],
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
                                                  Checkbox(
                                                    activeColor: AppColors.v4,
                                                    checkColor: Colors.white,
                                                    value: _isPressedCheck,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _isPressedCheck =
                                                            value!;
                                                      });
                                                    },
                                                  ),
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
                                                    top: 16.0),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "작성완료",
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
                                                                        3), // 네모난 모서리를 위한 값 설정
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
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(color: AppColors.g1),
                      ),
                    ),
                    Row(
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
                        child: Image.asset(
                          'assets/images/newsletter_blurcomment.png',
                          width: double.infinity,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
