import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/chip_editor.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/design/widgets/home/recommend_box.dart';
import 'package:meetup/design/widgets/home/term_dialog.dart';
import 'package:meetup/viewModel/home_viewModel.dart';
import 'package:meetup/viewModel/user_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import 'package:get/get.dart';

import '../../design/style/FontStyles.dart';
import '../../design/widgets/history_widget.dart';
import '../../design/widgets/home/archive_dialog.dart';
import '../../routes/get_pages.dart';

class TodayTermScreen extends GetView<HomeViewModel> {
  const TodayTermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewModel());
    Get.put(UserViewModel());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: BackAppBar(iconColor: AppColors.black, title: null),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Chip(
                  visualDensity: const VisualDensity(
                    horizontal: 2,
                    vertical: -4,
                  ),
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.g2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    '오늘의 단어',
                    style: FontStyles.Caption2_sb.copyWith(color: AppColors.v5),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    controller.homeModel?.todayTerm.koreanName ?? 'no data',
                    style:
                        FontStyles.Title2_sb.copyWith(color: AppColors.black),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.isWordBookMark.value
                          ? controller.isWordBookMark.value = false
                          : controller.isWordBookMark.value = true;

                      if (controller.isWordBookMark.value) {
                        controller.archives(
                            'TERM', controller.homeModel!.todayTerm.termId);

                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return TermDialog();
                              },
                            );
                          },
                        );
                      }
                    },
                    child: Obx(
                      () => SvgPicture.asset(controller.isWordBookMark.value
                          ? 'assets/icons/bookmark_fill.svg'
                          : 'assets/icons/bookmark_unfill.svg'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  controller.homeModel?.todayTerm.englishName ?? 'no data',
                  style: FontStyles.Ln1_m.copyWith(color: AppColors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    CustomChip(label: '글로벌 경제'),
                    CustomChip(label: '주식'),
                    Spacer(),
                    Text(
                      '2024.05.14',
                      style:
                          FontStyles.Caption1_r.copyWith(color: AppColors.g4),
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.g1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: RichText(
                  text: TextSpan(
                    text: controller.homeModel!.todayTerm.koreanName,
                    style: FontStyles.Headline1_b.copyWith(color: AppColors.v6),
                    children: <TextSpan>[
                      TextSpan(
                        text: '이 뭐야?',
                        style: FontStyles.Headline1_b.copyWith(
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: AppColors.g1,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(21, 16, 21, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        controller.homeModel!.todayTerm.description,
                        style: FontStyles.Ln1_r.copyWith(
                          color: AppColors.black,
                        ),
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: Text(
              //     '언제 사용되는데?',
              //     style:
              //         FontStyles.Headline1_b.copyWith(color: AppColors.black),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 38.0),
              //   child: Card(
              //     color: AppColors.g1,
              //     surfaceTintColor: Colors.transparent,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              //       child: Column(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(bottom: 20.0),
              //             child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(right: 12.0),
              //                   child: Align(
              //                     alignment: Alignment.topCenter,
              //                     child: SvgPicture.asset(
              //                         'assets/images/newsletter_dotori.svg'),
              //                   ),
              //                 ),
              //                 Flexible(
              //                   child: Align(
              //                     alignment: Alignment.topCenter,
              //                     child: Text(
              //                       '“미국 기업 ‘테슬라’가 적자였음에도 불구하고 나스닥에서 상장한 후 크게 발전한 사례에서 따와서 ‘테슬라 요건’이라는 이름이 붙었어요!”',
              //                       style: FontStyles.Ln1_r.copyWith(
              //                           color: AppColors.black),
              //                       softWrap: true,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(bottom: 20.0),
              //             child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(right: 12.0),
              //                   child: Align(
              //                     alignment: Alignment.topCenter,
              //                     child: SvgPicture.asset(
              //                         'assets/images/newsletter_dotori.svg'),
              //                   ),
              //                 ),
              //                 Flexible(
              //                   child: Align(
              //                     alignment: Alignment.topCenter,
              //                     child: Text(
              //                       '“우리나라는 2017년부터 테슬라 요건을 적용하고 있어요.”',
              //                       style: FontStyles.Ln1_r.copyWith(
              //                           color: AppColors.black),
              //                       softWrap: true,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.only(right: 12.0),
              //                 child: Align(
              //                   alignment: Alignment.topCenter,
              //                   child: SvgPicture.asset(
              //                       'assets/images/newsletter_dotori.svg'),
              //                 ),
              //               ),
              //               Flexible(
              //                 child: Align(
              //                   alignment: Alignment.topCenter,
              //                   child: Text(
              //                     '“국내에서 테슬라 요건으로 최초 상장한 기업은 온라인 상거래 플랫폼 사업을 영위하는 카페24예요.”',
              //                     style: FontStyles.Ln1_r.copyWith(
              //                         color: AppColors.black),
              //                     softWrap: true,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Divider(
                thickness: 8,
                color: AppColors.g1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0, bottom: 16.0),
                child: Text(
                  '관련 뉴스',
                  style:
                      FontStyles.Headline1_b.copyWith(color: AppColors.black),
                ),
              ),
              Obx(
                    () => RecommendU(
                      image: controller
                          .homeModel?.customizeNewsLetters[0].thumbnail ??
                          'no data',
                      title:
                      controller.homeModel!.customizeNewsLetters[0].title,
                      isRecommend: controller.isRecommendFirst.value,
                      onRecommend: () {
                        controller.isRecommendFirst.value
                            ? controller.isRecommendFirst.value = false
                            : controller.isRecommendFirst.value = true;

                        if (controller.isRecommendFirst.value) {
                          controller.archives(
                              'NEWS', controller.homeModel!.customizeNewsLetters[0].id);

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
                      tag: CustomChip(label: controller.parseCustom1()[0],),
                      history: History(
                        diff: controller.formatDate(
                          DateTime.parse(controller
                              .homeModel!.customizeNewsLetters[0].createdAt),
                        ),
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


