import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/chip_editor.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/design/widgets/home/recommend_box.dart';
import 'package:meetup/design/widgets/home/term_dialog.dart';
import 'package:meetup/viewModel/user_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import 'package:get/get.dart';

import '../../design/style/FontStyles.dart';
import '../../design/widgets/history_widget.dart';
import '../../design/widgets/home/archive_dialog.dart';
import '../../routes/get_pages.dart';

class TodayTermScreen extends StatelessWidget {
  const TodayTermScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    '테슬라 요건',
                    style:
                        FontStyles.Title2_sb.copyWith(color: AppColors.black),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        // showDialog(
                        //   barrierDismissible: false,
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return StatefulBuilder(
                        //       builder:
                        //           (BuildContext context, StateSetter setState) {
                        //         return TermDialog();
                        //       },
                        //     );
                        //   },
                        // );
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
                      },
                      child: SvgPicture.asset('assets/icons/bookmark_unfill.svg')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Tesla’s requirements',
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
                    text: '테슬라 요건',
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
                        '주식 시장에 상장하기 위한 요건을 갖추지 못한 기업들 중에 잠재력이 큰 곳들을 골라 상장 기회를 주는 제도예요!',
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
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '언제 사용되는데?',
                  style:
                      FontStyles.Headline1_b.copyWith(color: AppColors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 38.0),
                child: Card(
                  color: AppColors.g1,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SvgPicture.asset(
                                      'assets/images/newsletter_dotori.svg'),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '“미국 기업 ‘테슬라’가 적자였음에도 불구하고 나스닥에서 상장한 후 크게 발전한 사례에서 따와서 ‘테슬라 요건’이라는 이름이 붙었어요!”',
                                    style: FontStyles.Ln1_r.copyWith(
                                        color: AppColors.black),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SvgPicture.asset(
                                      'assets/images/newsletter_dotori.svg'),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '“우리나라는 2017년부터 테슬라 요건을 적용하고 있어요.”',
                                    style: FontStyles.Ln1_r.copyWith(
                                        color: AppColors.black),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SvgPicture.asset(
                                    'assets/images/newsletter_dotori.svg'),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '“국내에서 테슬라 요건으로 최초 상장한 기업은 온라인 상거래 플랫폼 사업을 영위하는 카페24예요.”',
                                  style: FontStyles.Ln1_r.copyWith(
                                      color: AppColors.black),
                                  softWrap: true,
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
              Stack(
                children: [
                  Card(
                    color: AppColors.white,
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                              height: Get.height * 0.13,
                              width: Get.width * 0.3,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Expanded(
                            child: Text(
                              '“코인 급등 랠리?” 도지코인 거래 급감',
                              style: FontStyles.Ln1_m.copyWith(
                                  color: AppColors.black),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  border: Border.all(
                                    color: AppColors.g2.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                  'assets/icons/bookmark_unfill.svg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 125,
                    bottom: 10,
                    child: Row(
                      children: [
                        CustomChip(label: '코인'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: History(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
