import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';

import '../../viewModel/home_viewModel.dart';

class NewsLetterScreen extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = Get.put(HomeViewModel()); // GetX 컨트롤러를 가져옴
    controller.getEditorNews(); // 뉴스 데이터 가져오기
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
              Image.asset('assets/images/news_letter_preview.png',width: double.infinity,height: 142,)
              ,Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Flexible(
                        child: Text(
                          controller.news.value.blocks[0].content,
                          softWrap: true,
                          style: FontStyles.Title2_sb.copyWith(
                              color: AppColors.black),
                        ),
                      ),
                    ),
                    //Expanded(child: Container()),
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
                        child: Obx(() => Text(controller.news.value.publishedAt,
                            style: FontStyles.Ln1_r.copyWith(
                                color: Colors.grey)))),
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
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          text: 'Edit By. ',
                          style: FontStyles.Caption1_r.copyWith(
                              color: AppColors.g3), //기본style을 지정해줘야함
                          children: <TextSpan>[
                            TextSpan(
                              text: controller.news.value.editor,
                              style: FontStyles.Caption1_m.copyWith(
                                  color: AppColors.g3), //기본style을 지정해줘야함
                            ),
                          ],
                        ),
                      ),
                    )
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
                              child: Obx(() => Text(
                                    controller.splitParagraph(
                                        controller.news.value.blocks[1].content,
                                        0),
                                    softWrap: true,
                                    style: FontStyles.Ln1_m.copyWith(
                                        color: AppColors.g6),
                                  ))),
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
                              child: Obx(() => Text(
                                    controller.splitParagraph(
                                        controller.news.value.blocks[1].content,
                                        1),
                                    softWrap: true,
                                    style: FontStyles.Ln1_m.copyWith(
                                        color: AppColors.g6),
                                  ))),
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
                              child: Obx(() => Text(
                                    controller.splitParagraph(
                                        controller.news.value.blocks[1].content,
                                        2),
                                    softWrap: true,
                                    style: FontStyles.Ln1_m.copyWith(
                                        color: AppColors.g6),
                                  ))),
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
                        child: Obx(() => Text(
                              controller.news.value.blocks[2].content,
                              softWrap: true,
                              style: FontStyles.Ln1_r,
                            ))),
                    Obx(() => Text(controller.news.value.blocks[3].content,
                        softWrap: true,
                        style: FontStyles.Ln1_r.copyWith(color: Colors.black))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                        child: Obx(
                          () => Image.network(
                            width: 328,
                            height: 164,
                            controller.news.value.blocks[4].content,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return CircularProgressIndicator(); // 이미지 로딩 중이면 로딩 스피너 표시
                              }
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Text(
                                  'Failed to load image'); // 이미지 로딩에 실패하면 에러 메시지 표시
                            },
                          ),
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
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('오늘의 ',style: FontStyles.Br2_sb),
                              SvgPicture.asset('assets/icons/editor_newthink.svg'),
                              Text(' 어떠셨나요?',style: FontStyles.Br2_sb),
                            ],
                          ),
                        ),
                    Image.asset(
                      'assets/icons/news_letter_think.png',
                      width: 143,
                      height: 143,
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
