import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:meetup/design/widgets/appBar/dialog_appBar.dart';
import 'package:meetup/design/widgets/plus/stop_dialog.dart';
import 'package:meetup/design/widgets/plus/summary_dialog.dart';
import 'package:meetup/design/widgets/tooltip_balloon.dart';
import 'package:meetup/viewModel/plus_viewModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/appBar/back_appBar.dart';
import '../../design/widgets/plus_tooltip.dart';
import '../../viewModel/plus_home_viewModel.dart';

class PlusStep1Screen extends GetView<PlusViewModel> {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    final int index = arguments['index'];

    Get.put(PlusViewModel());
    final plusHomeController = Get.put(PlusHomeViewModel());
    controller.addSentence(plusHomeController.cloudHomeModel?.thinkingDetails?[index].summarizedComment ?? '요약된 생각이 없습니다.', 0);
    controller.postSummaryRequired('1');
    final PageController pageController =
        PageController(initialPage: 0, viewportFraction: 0.75);

    return Scaffold(
        backgroundColor: AppColors.g1,
        appBar: DialogAppBar(
          iconColor: AppColors.black,
          title: null,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/icons/plus_say3.png',),
                    Obx(
                      () => Positioned(
                        top: 37,
                          child: Text(
                        controller.updatePage(controller.currentPage.value),
                        style: FontStyles.Caption1_sb.copyWith(
                            color: AppColors.g6),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                        height: 230,
                        width: double.infinity, // 페이지뷰 높이 설정
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            controller.updatePage(index);
                          },
                          children: [
                            // 첫 번째 페이지
                            Center(
                              child: Container(
                                width: 290,
                                height: 262,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        child: Container(
                                      width: 290,
                                      height: 182,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(17),
                                              topRight: Radius.circular(17)),
                                          color: AppColors.v2,
                                          border:
                                              Border.all(color: AppColors.v1)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/icons/plus_1.png',
                                            width: 180,height: 180,
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
                                          width: 290,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(17),
                                                  bottomRight:
                                                      Radius.circular(17)),
                                              color: AppColors.white,
                                              border: Border.all(
                                                  color: AppColors.v1)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                child: Text(
                                                  controller.sentencesList[0].sentence,
                                                  style: FontStyles.Ln1_sb.copyWith(
                                                      color: AppColors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            // 두 번째 페이지
                            Container(
                              width: 290,
                              height: 262,
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    width: 290,
                                    height: 182,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17),
                                            topRight: Radius.circular(17)),
                                        color: AppColors.v2,
                                        border:
                                            Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        width: 290,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(17),
                                                bottomRight:
                                                    Radius.circular(17)),
                                            color: AppColors.white,
                                            border: Border.all(
                                                color: AppColors.v1)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Obx(()
                                              => Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text(
                                                  controller.sentencesList[1].sentence,
                                                  style: FontStyles.Ln1_sb.copyWith(
                                                      color: AppColors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              width: 290,
                              height: 262,
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    width: 290,
                                    height: 182,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17),
                                            topRight: Radius.circular(17)),
                                        color: AppColors.v2,
                                        border:
                                            Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        width: 290,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(17),
                                                bottomRight:
                                                    Radius.circular(17)),
                                            color: AppColors.white,
                                            border: Border.all(
                                                color: AppColors.v1)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Obx(()
                                              => Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text(
                                                  controller.sentencesList[2].sentence,
                                                  style: FontStyles.Ln1_sb.copyWith(
                                                      color: AppColors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              width: 290,
                              height: 262,
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    width: 290,
                                    height: 180,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17),
                                            topRight: Radius.circular(17)),
                                        color: AppColors.v2,
                                        border:
                                            Border.all(color: AppColors.v1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        width: 290,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(17),
                                                bottomRight:
                                                    Radius.circular(17)),
                                            color: AppColors.white,
                                            border: Border.all(
                                                color: AppColors.v1)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Obx(()
                                              => Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text(
                                                  controller.sentencesList[3].sentence,
                                                  style: FontStyles.Ln1_sb.copyWith(
                                                      color: AppColors.black),
                                                ),
                                              ),
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
                      activeDotColor: AppColors.v5,
                    ),
                  ),
                ),
                //Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Container(
                    width: 378,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '생각더하기',
                                style: FontStyles.Headline2_b.copyWith(
                                    color: AppColors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Tooltip(
                                  preferBelow: false,
                                  message:
                                      '어떤 이유로 발생했을까요? 어떤 효과가 나타날까요?\n앞선 구름을 보고 느낀 생각을 자유롭게 적어보세요!',
                                  textStyle: FontStyles.Caption2_r.copyWith(
                                      color: AppColors.v5),
                                  decoration: ShapeDecoration(
                                    // borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.v1.withOpacity(0.95),
                                    shape: PlusToolTip(),
                                  ),
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: SvgPicture.asset(
                                      'assets/icons/plus_info.svg'),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.isSummary.value = true;
                                    print(
                                        '페이지${controller.currentPageIndex.value}');
                                    controller.addSentence(
                                        controller.summary.value,
                                        controller.currentPageIndex.value+1);
                                    print('뷰모델2 : ${controller.summary.value}');
                                    controller.postSummaryRequired(
                                        controller.plusComment.value.text);
                                    controller
                                        .setEditText(controller.summary.value);
                                    print(
                                        '뷰모델1${controller.sentencesList[1].sentence}');
                                  },
                                  child: Container(
                                    width: 79,
                                    height: 33,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColors.g5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '요약하기',
                                          style:
                                              FontStyles.Caption2_sb.copyWith(
                                                  color: AppColors.white),
                                        ),
                                        SvgPicture.asset(
                                            'assets/icons/plus_summary.svg')
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            width: 340,
                            height: 170,
                            child: TextFormField(
                              controller: controller.plusComment,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              maxLength: 100,
                              expands: true,
                              decoration: InputDecoration(
                                hintText: '작성하고 꼭! 요약하기를 실행해주세요. (최대 100자)',
                                hintStyle: FontStyles.Caption2_r.copyWith(
                                    color: AppColors.g5),
                                filled: true,
                                fillColor: AppColors.g1,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (text) {
                                controller.plusComment.value.text;
                                print("text field: $text");
                              },
                            ),
                          ),
                        ),
                        Spacer(),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              if (controller.isSummary.value) {
                                controller.nextPage(index); // 뷰 모델의 nextPage 메서드 호출
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                                controller.isSummary.value = false;
                                controller.plusComment
                                    .clear(); // 페이지 컨트롤러를 통해 페이지 변경
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                width: 340,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: controller.isSummary.value
                                      ? AppColors.v6
                                      : AppColors.g2,
                                ),
                                child: Center(
                                  child: Text(
                                    '등록하기',
                                    style: FontStyles.Ln1_sb.copyWith(
                                      color: controller.isSummary.value
                                          ? AppColors.white
                                          : AppColors.g4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
