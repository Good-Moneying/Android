import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetup/design/widgets/chip_editor.dart';
import 'package:meetup/design/widgets/home/recommend_box.dart';

import '../../design/style/ColorStyles.dart';
import 'package:get/get.dart';

import '../../design/style/FontStyles.dart';

class TodayTermScreen extends StatelessWidget {
  const TodayTermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            'assets/icons/back_left.svg',
            height: 36,
            width: 36,
          ),
        ),
      ),
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
                  SvgPicture.asset('assets/icons/bookmark_unfill.svg'),
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
                              Align(
                                alignment: Alignment.topCenter,
                                child: SvgPicture.asset(
                                    'assets/images/newsletter_dotori.svg'),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '“미국 기업 ‘테슬라’가 적자였음에도 불구하고 \n나스닥에서 상장한 후 크게 발전한 사례에서 \n따와서 ‘테슬라 요건’이라는 이름이 붙었어요!”',
                                  style: FontStyles.Ln1_r.copyWith(
                                      color: AppColors.black),
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
                              Align(
                                alignment: Alignment.topCenter,
                                child: SvgPicture.asset(
                                    'assets/images/newsletter_dotori.svg'),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '“미국 기업 ‘테슬라’가 적자였음에도 불구하고 \n나스닥에서 상장한 후 크게 발전한 사례에서 \n따와서 ‘테슬라 요건’이라는 이름이 붙었어요!”',
                                  style: FontStyles.Ln1_r.copyWith(
                                      color: AppColors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: SvgPicture.asset(
                                  'assets/images/newsletter_dotori.svg'),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '“미국 기업 ‘테슬라’가 적자였음에도 불구하고 \n나스닥에서 상장한 후 크게 발전한 사례에서 \n따와서 ‘테슬라 요건’이라는 이름이 붙었어요!”',
                                style: FontStyles.Ln1_r.copyWith(
                                    color: AppColors.black),
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
                padding: const EdgeInsets.only(top: 21.0),
                child: Text(
                  '관련 뉴스',
                  style:
                      FontStyles.Headline1_b.copyWith(color: AppColors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
