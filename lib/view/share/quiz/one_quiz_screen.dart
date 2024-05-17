import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/custom_button.dart';
import 'package:meetup/design/widgets/progress_bar.dart';
import 'package:meetup/design/widgets/share/choice_quiz.dart';

import '../../../routes/get_pages.dart';

class OneQuizScreen extends StatelessWidget {
  const OneQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(iconColor: AppColors.black),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyProgressBar(
                percent: 0.15,
                backgroundColor: AppColors.g1,
                progressColor: AppColors.v2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48, bottom: 4.0),
                child: Text(
                  'Quiz 2',
                  style: FontStyles.Headline2_b.copyWith(color: AppColors.v5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  '정부는 앞으로 전기차 정책의 방향성은?',
                  style: FontStyles.Bn1_b.copyWith(color: AppColors.g6),
                ),
              ),
              ChoiceQuiz(number: 'A', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              ChoiceQuiz(number: 'B', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              ChoiceQuiz(number: 'C', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              ChoiceQuiz(number: 'D', detail: '보조금 단가는 올리고, 물량도 늘린다'),
              Spacer(),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      backgroundColor: AppColors.v1,
                      textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.v5),
                      label: '힌트 보기',
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return AlertDialog(
                                  surfaceTintColor: Colors.transparent,
                                  backgroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  //insetPadding: EdgeInsets.zero,
                                  contentPadding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0, bottom: 32),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/mypage_rain.png',
                                        width: 29,
                                        height: 31,
                                      ),
                                      Text(
                                        "3 토큰",
                                        style: FontStyles.Headline2_b.copyWith(
                                            color: AppColors.v6),
                                      ),
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 19.0, bottom: 8.0),
                                        child: Text(
                                          '토큰을 사용해서 힌트를 보시겠어요?',
                                          style:
                                              FontStyles.Headline2_b.copyWith(
                                                  color: AppColors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 17.0),
                                        child: Text(
                                          '3 토큰을 사용하시면 힌트를 볼 수 있어요!',
                                          style: FontStyles.Caption1_m.copyWith(
                                              color: AppColors.g4),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 19.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.g1,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        24, 14, 13, 14),
                                                child: Text(
                                                  '현재 보유 토큰',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color:
                                                              AppColors.black),
                                                ),
                                              ),
                                              Spacer(),
                                              Image.asset(
                                                'assets/icons/mypage_rain.png',
                                                width: 29,
                                                height: 31,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 13.0),
                                                child: Text(
                                                  '20',
                                                  style:
                                                      FontStyles.Ln1_m.copyWith(
                                                          color:
                                                              AppColors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                minimumSize:
                                                    const Size.fromHeight(50),
                                                backgroundColor:
                                                    AppColors.white,
                                                side: BorderSide(
                                                  color: AppColors.g3,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                '안볼래요',
                                                style:
                                                    FontStyles.Ln1_sb.copyWith(
                                                  color: Color(0xFFAAAAB9),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                      const Size.fromHeight(50),
                                                  backgroundColor: AppColors.g6,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  )),
                                              child: Text(
                                                '힌트 볼래요',
                                                style:
                                                    FontStyles.Ln1_sb.copyWith(
                                                        color: AppColors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                            });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      backgroundColor: AppColors.v1,
                      textStyle: FontStyles.Bn1_b.copyWith(color: AppColors.v5),
                      label: '정답 제출하기',
                      onPressed: null,
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
