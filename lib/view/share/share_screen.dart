import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/share/think_bottomSheet.dart';
import 'package:meetup/viewModel/home_viewModel.dart';
import 'package:meetup/viewModel/share_viewModel.dart';

import '../../design/widgets/chip_editor.dart';
import '../../design/widgets/home/news_slider.dart';
import '../../design/widgets/home/recommend_box.dart';
import '../../routes/get_pages.dart';

class ShareScreen extends GetView<ShareViewModel> {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShareViewModel());

    var homeController = Get.find<HomeViewModel>();
    var shareController = Get.find<ShareViewModel>();

    return Scaffold(
      backgroundColor: AppColors.g1,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            Text(
              '생각나누기',
              style: FontStyles.Headline2_b.copyWith(color: AppColors.g6),
            ),
            Expanded(
              child: Container(),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ADDSURVEY);
              },
              child: SvgPicture.asset('assets/icons/add_survey.svg'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                '오늘의 설문',
                style: FontStyles.Headline2_b.copyWith(color: AppColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    //Get.toNamed(Routes.SURVEY);
                    //기사 url로 넘어가도록 해야함
                  },
                  child: RecommendU(
                    image:
                        'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                    title:
                        newsController.homeModel!.customizeNewsLetters[0].title,
                    tag: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: homeController.parseCustom1().map((keyword) {
                        return CustomChip(label: keyword);
                      }).toList(),
                    ),
                    isRecommend: newsController.isRecommendFirst.value,
                    onRecommend: () {
                      newsController.isRecommendFirst.value
                          ? newsController.isRecommendFirst.value = false
                          : newsController.isRecommendFirst.value = true;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Card(
                color: AppColors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Chip(
                          visualDensity: const VisualDensity(
                            horizontal: 2,
                            vertical: -4,
                          ),
                          backgroundColor: AppColors.g1,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          avatar: SvgPicture.asset(
                              'assets/icons/history_unfill.svg'),
                          label: Text(
                            '17:28:02',
                            style: FontStyles.Caption2_r.copyWith(
                                color: AppColors.v6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Q. ',
                                style: FontStyles.Br1_sb.copyWith(
                                    color: AppColors.v6),
                              ),
                              TextSpan(
                                text: '전기차의 보급을 확대하기 위해\n정부의 추가적인 지원이 필요하다',
                                style: FontStyles.Br1_sb.copyWith(
                                    color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 29.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/check.svg'),
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Text(
                                '387명',
                                style: FontStyles.Caption2_m.copyWith(
                                    color: AppColors.g5),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/people.svg'),
                            Text(
                              '연디',
                              style: FontStyles.Caption2_m.copyWith(
                                  color: AppColors.g5),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return ThinkContainer(
                                              textField: TextField(
                                                controller:
                                                    controller.thinkController,
                                                maxLength: 300,
                                                maxLines: null,
                                                textInputAction:
                                                    TextInputAction.done,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: FontStyles.Caption1_r
                                                    .copyWith(
                                                        color: AppColors.black),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    hintText:
                                                        '여러분의 생각을 남겨보세요. (최대 300자)',
                                                    hintStyle: FontStyles
                                                            .Caption1_r
                                                        .copyWith(
                                                            color:
                                                                AppColors.g5),
                                                    border: InputBorder.none),
                                              ),
                                              onPressed:
                                                  controller
                                                          .thinkController
                                                          .value
                                                          .text
                                                          .isEmpty
                                                      ? null
                                                      : () {
                                                    Get.offNamed(Routes.SURVEY, arguments: controller.thinkController.text,);
                                                    controller.thinkController.clear();

                                                    },
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                        color: AppColors.v2,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 1, 14, 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/icons/agreement.png'),
                                          Text(
                                            '찬성',
                                            style:
                                                FontStyles.Caption1_m.copyWith(
                                                    color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return ThinkContainer(
                                              textField: TextField(
                                                controller:
                                                controller.thinkController,
                                                maxLength: 300,
                                                maxLines: null,
                                                textInputAction:
                                                TextInputAction.done,
                                                keyboardType:
                                                TextInputType.text,
                                                style: FontStyles.Caption1_r
                                                    .copyWith(
                                                    color: AppColors.black),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    hintText:
                                                    '여러분의 생각을 남겨보세요. (최대 300자)',
                                                    hintStyle: FontStyles
                                                        .Caption1_r
                                                        .copyWith(
                                                        color:
                                                        AppColors.g5),
                                                    border: InputBorder.none),
                                              ),
                                              onPressed:
                                              controller
                                                  .thinkController
                                                  .value
                                                  .text
                                                  .isEmpty
                                                  ? null
                                                  : () {
                                                Get.offNamed(Routes.SURVEY, arguments: controller.thinkController.text,);
                                                controller.thinkController.clear();
                                              },
                                            );
                                            ();
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                        color: AppColors.v2,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 1, 14, 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/icons/disagreement.png'),
                                          Text(
                                            '반대',
                                            style:
                                                FontStyles.Caption1_m.copyWith(
                                                    color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.v6,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8),
                              child: Text(
                                'VS',
                                style: FontStyles.Caption1_m.copyWith(
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.FIRSTQUIZ);
              },
              child: Image.asset(
                'assets/icons/quiz_banner.png',
                width: Get.width,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
