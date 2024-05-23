import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/viewModel/plus_home_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/comment_widget.dart';
import '../../design/widgets/home/archive_dialog.dart';
import '../../viewModel/home_viewModel.dart';

class LiveNewsScreen extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = Get.put(HomeViewModel()); // GetX 컨트롤러를 가져옴
    controller.getEditorNews(controller.homeModel!.realtimeTrendNewsLetters[0].id);

    return Obx(
        () { if (controller.isLoadingReal.value) {
          return Scaffold(
            backgroundColor: AppColors.g1,
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.v5,
              ),
            ),
          );
        } else {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: BackAppBar(iconColor: AppColors.black, title: null),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                                  () => Flexible(
                                child: Text(
                                  controller.newsLetterModel?.title ?? 'none',
                                  softWrap: true,
                                  style: FontStyles.Title2_sb.copyWith(
                                      color: AppColors.black),
                                ),
                              ),
                            ),
                            //Expanded(child: Container()),
                            Obx(
                                  ()=> IconButton(
                                icon: SvgPicture.asset(
                                    controller.isLiveBookMark.value
                                        ? 'assets/icons/bookmark_fill.svg'
                                        : 'assets/icons/bookmark_unfill.svg'),
                                onPressed: () {
                                  controller.isLiveBookMark.value
                                      ? controller.isLiveBookMark.value = false
                                      : controller.isLiveBookMark.value = true;

                                  if (controller.isLiveBookMark.value) {
                                    controller.archives(
                                        'NEWS', controller.homeModel!.realtimeTrendNewsLetters[0].id);

                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder:
                                              (BuildContext context, StateSetter setState) {
                                            return ArchiveDialog();
                                          },
                                        );
                                      },
                                    );
                                  }

                                },
                              ),
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
                                child: Obx(()=>
                                    Text(
                                      controller.splitKeywords(controller.homeModel!.realtimeTrendNewsLetters[0].keywords, 0),
                                      style: FontStyles.Caption2_m.copyWith(
                                          color: AppColors.g6),
                                    ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Obx(() => Text(controller.dateParsing(controller.homeModel!.todayNewsLetter.createdAt),
                                    style: FontStyles.Ln1_r.copyWith(
                                        color: Colors.grey)))),
                            Expanded(child: Container()),
                            /*Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            // 오른쪽에 여백 추가
                            child: Obx(
                                  () => Image.network(
                                width: 20,
                                height: 20,
                                controller.newsLetterModel!.editor!.profileUrl!,
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
                            ),
                          ),*/
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
                                      "3줄 요약",
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
                                      child: Image.asset(
                                        'assets/icons/news_cloud.png', width: 25, height: 25,)
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        18.0, 20.0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                        child: Obx(() => Text(
                                          controller.splitParagraph(
                                            controller.newsLetterModel?.summary ?? 'a',
                                            0,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible, // 필요에 따라 변경
                                          style: FontStyles.Ln1_m.copyWith(color: AppColors.g6),
                                        ))),
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
                                      child: Image.asset(
                                        'assets/icons/news_cloud.png', width: 25, height: 25,)
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        18.0, 0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                        child: Obx(() => Text(
                                          controller.splitParagraph(
                                            controller.newsLetterModel?.summary ?? 'a',
                                            1,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible, // 필요에 따라 변경
                                          style: FontStyles.Ln1_m.copyWith(color: AppColors.g6),
                                        ))),
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
                                      child: Image.asset(
                                        'assets/icons/news_cloud.png', width: 25, height: 25,)
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        18.0, 0, 0.0, 0.0), // 상단에 20.0만큼의 패딩을 추가합니다.
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        // 이미지를 컨테이너의 상단 중앙에 정렬합니다.
                                        child: Obx(() => Text(
                                          controller.splitParagraph(
                                            controller.newsLetterModel?.summary ?? 'a',
                                            2,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible, // 필요에 따라 변경
                                          style: FontStyles.Ln1_m.copyWith(color: AppColors.g6),
                                        ))),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '뉴스 전문 보기',
                              style:
                              FontStyles.Caption1_m.copyWith(color: AppColors.g4),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset('assets/icons/view_more.svg')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/editor_live.svg'),
                            SvgPicture.asset('assets/icons/editor_newthink.svg'),
                            Text(' 에 대한 생각 듣고싶어요!', style: FontStyles.Br2_sb),
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
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                    SingleChildScrollView(
                                      child: Container(
                                        height: Get.height * 0.53,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Spacer(),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 25.0),
                                                  child: Text(
                                                    '내 생각 작성하기',
                                                    style: FontStyles.Br2_m.copyWith(
                                                        color: AppColors.g6),
                                                  ),
                                                ),
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: SvgPicture.asset(
                                                      'assets/images/newsletter_close.svg'), // 닫기 아이콘
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: AppColors.g6,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Text(
                                                '앞으로 어떻게 될 것 같나요?',
                                                style: FontStyles.Br1_sb.copyWith(
                                                    color: AppColors.g6),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  16, 0, 16, 16),
                                              child: Row(
                                                children: [
                                                  Obx(() => InkWell(
                                                    onTap: () {
                                                      controller.selectAgree(0);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                      child: Column(
                                                        children: [
                                                          controller
                                                              .isDialogAgreeList[0]
                                                              ? Container(
                                                            width: 90,
                                                            height: 31,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    14.6),
                                                                color:
                                                                AppColors
                                                                    .v1,
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .v6)),
                                                            child: Center(
                                                              child: Text(
                                                                '긍정적인 전망',
                                                                style: FontStyles
                                                                    .Caption2_sb
                                                                    .copyWith(
                                                                    color:
                                                                    AppColors.v6),
                                                              ),
                                                            ),
                                                          )
                                                              : Container(
                                                            width: 90,
                                                            height: 31,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    14.6),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xFFAAAAB9))),
                                                            child: Center(
                                                              child: Text(
                                                                '긍정적인 전망',
                                                                style: FontStyles
                                                                    .Caption2_sb
                                                                    .copyWith(
                                                                    color:
                                                                    Color(0xFFAAAAB9)),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  Obx(() => InkWell(
                                                    onTap: () {
                                                      controller.selectAgree(1);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                      child: Column(
                                                        children: [
                                                          controller
                                                              .isDialogAgreeList[1]
                                                              ? Container(
                                                            width: 90,
                                                            height: 31,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    14.6),
                                                                color:
                                                                AppColors
                                                                    .v1,
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .v6)),
                                                            child: Center(
                                                              child: Text(
                                                                '부정적인 전망',
                                                                style: FontStyles
                                                                    .Caption2_sb
                                                                    .copyWith(
                                                                    color:
                                                                    AppColors.v6),
                                                              ),
                                                            ),
                                                          )
                                                              : Container(
                                                            width: 90,
                                                            height: 31,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    14.6),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xFFAAAAB9))),
                                                            child: Center(
                                                              child: Text(
                                                                '부정적인 전망',
                                                                style: FontStyles
                                                                    .Caption2_sb
                                                                    .copyWith(
                                                                    color:
                                                                    Color(0xFFAAAAB9)),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                                  Obx(() => InkWell(
                                                    onTap: () {
                                                      controller.selectAgree(2);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                      child: Column(
                                                        children: [
                                                          controller
                                                              .isDialogAgreeList[2]
                                                              ? Container(
                                                            width: 90,
                                                            height: 31,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    14.6),
                                                                color:
                                                                AppColors
                                                                    .v1,
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .v6)),
                                                            child: Center(
                                                              child: Text(
                                                                '잘 모르겠음',
                                                                style: FontStyles
                                                                    .Caption2_sb
                                                                    .copyWith(
                                                                    color:
                                                                    AppColors.v6),
                                                              ),
                                                            ),
                                                          )
                                                              : Container(
                                                            width: 90,
                                                            height: 31,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    14.6),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xFFAAAAB9))),
                                                            child: Center(
                                                              child: Text(
                                                                '잘 모르겠음',
                                                                style: FontStyles
                                                                    .Caption2_sb
                                                                    .copyWith(
                                                                    color:
                                                                    Color(0xFFAAAAB9)),
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
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  16, 0, 16, 8),
                                              child: Container(
                                                height: Get.height * 0.17,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: AppColors.g1,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: TextField(
                                                    controller:
                                                    controller.liveController,
                                                    maxLength: 200,
                                                    maxLines: null,
                                                    textInputAction:
                                                    TextInputAction.done,
                                                    keyboardType: TextInputType.text,
                                                    style: FontStyles.Caption1_r
                                                        .copyWith(
                                                        color: AppColors.black),
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        hintText:
                                                        '여러분의 생각을 남겨보세요. (최대 200자)',
                                                        hintStyle: FontStyles
                                                            .Caption1_r
                                                            .copyWith(
                                                            color: AppColors.g5),
                                                        border: InputBorder.none),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Obx(() => Checkbox(
                                                  activeColor: AppColors.v5,
                                                  checkColor: Colors.white,
                                                  value: controller
                                                      .isLookAlone.value,
                                                  onChanged: (value) {
                                                    controller.selectLook();
                                                  },
                                                )),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 16.0),
                                                  child: Text(
                                                    "나 혼자만 볼래요",
                                                    style:
                                                    FontStyles.Label2_r.copyWith(
                                                        color: AppColors.g6),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  16, 0, 16, 16),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  //댓글 작성하기
                                                  await controller.postComment(
                                                    'LIVE',
                                                    controller.homeModel!.realtimeTrendNewsLetters[0].id,
                                                    controller.liveController.value.text,
                                                    controller.setPerspective(controller.isDialogAgreeList.value),
                                                      controller.isLookAlone.value
                                                  );

                                                  controller.liveController.clear();
                                                  Get.back();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                  const Size.fromHeight(50),
                                                  backgroundColor: AppColors.v6,
                                                ),
                                                child: Text(
                                                  '작성 완료',
                                                  style: FontStyles.Bn1_b.copyWith(
                                                      color: AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: Container(
                                  width: Get.width * 0.8,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.v6),
                                  child: Center(
                                      child: Text(
                                        '내 생각 작성하기',
                                        style: FontStyles.Bn1_b.copyWith(
                                            color: Colors.white),
                                      )),
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
                              style:
                              FontStyles.Heading2_b.copyWith(color: AppColors.g6),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                            () => Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: controller.isPostLiveNews.value
                              ? ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                CommentWidget(
                                  writer: '연디',
                                  time: '1분 전',
                                  content: controller.liveController.value.text,
                                  perspective: controller.setPerspective(controller.isDialogAgreeList.value),
                                  onFollow: ElevatedButton(
                                    onPressed: () {
                                      if (controller.isFollowReal.value == false) {
                                        controller.isFollowReal(true);
                                      } else {
                                        controller.isFollowReal(false);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      minimumSize: Size.zero,
                                      padding:
                                      EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
                                      backgroundColor:
                                      controller.isFollowReal.value ? AppColors.g2 : AppColors.g6,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      controller.isFollowReal.value ? '팔로잉' : '팔로우',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color: controller.isFollowReal.value
                                              ? AppColors.g5
                                              : AppColors.white),
                                    ),
                                  ),
                                  onLike: GestureDetector(
                                    onTap: () {
                                      if (controller.isLikeReal.value == false) {
                                        controller.isLikeReal(true);
                                      } else {
                                        controller.isLikeReal(false);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 4.0),
                                          //라이크 코멘트 색 채워졌을 때 필요함
                                          child: SvgPicture.asset(controller.isLikeReal.value
                                              ? 'assets/icons/like_comment.svg'
                                              : 'assets/icons/unlike_comment.svg'),
                                        ),
                                        Text(
                                          controller.isLikeReal.value ? '28' : '27',
                                          style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CommentWidget(
                                  writer: '데헌',
                                  time: '1시간 전',
                                  content: '원격 근무가 생산성도 높이고 국가 경제에도 긍정적인 영향을 미칠 것이라 예상되는데, 한국에는 아직 제대로 자리잡히지 않은 것 같아요.',
                                  perspective: '잘 모르겠어요',
                                  onFollow: ElevatedButton(
                                    onPressed: () {
                                      if (controller.isFollowReal2.value == false) {
                                        controller.isFollowReal2(true);
                                      } else {
                                        controller.isFollowReal2(false);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      minimumSize: Size.zero,
                                      padding:
                                      EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
                                      backgroundColor:
                                      controller.isFollowReal2.value ? AppColors.g2 : AppColors.g6,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      controller.isFollowReal2.value ? '팔로잉' : '팔로우',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color: controller.isFollowReal2.value
                                              ? AppColors.g5
                                              : AppColors.white),
                                    ),
                                  ),
                                  onLike: GestureDetector(
                                    onTap: () {
                                      if (controller.isLikeReal2.value == false) {
                                        controller.isLikeReal2(true);
                                      } else {
                                        controller.isLikeReal2(false);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 4.0),
                                          //라이크 코멘트 색 채워졌을 때 필요함
                                          child: SvgPicture.asset(controller.isLikeReal2.value
                                              ? 'assets/icons/like_comment.svg'
                                              : 'assets/icons/unlike_comment.svg'),
                                        ),
                                        Text(
                                          controller.isLikeReal2.value ? '28' : '27',
                                          style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]
                          )
                              : Image.asset(
                            'assets/images/newsletter_blurcomment.png',
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }
      }
    );
  }
}
