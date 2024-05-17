import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/comment_widget.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.g6,
      appBar: BackAppBar(iconColor: AppColors.white, title: null,),
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
                  style:
                      FontStyles.Headline2_b.copyWith(color: AppColors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                          height: Get.height * 0.08,
                          width: Get.width * 0.19,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      '정부가 공개한 "전기차 보급\n확대 중장기 로드맵"...주요 내용은?',
                      style: FontStyles.Ln1_m.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 38, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 1, 14, 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/agreement.png'),
                                        Text(
                                          '찬성',
                                          style: FontStyles.Caption1_m.copyWith(
                                              color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                flex: 1,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 1, 14, 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/disagreement.png'),
                                        Text(
                                          '반대',
                                          style: FontStyles.Caption1_m.copyWith(
                                              color: AppColors.black),
                                        ),
                                      ],
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
              // TabBar(
              //   tabs: [
              //     Tab(
              //       child: Chip(
              //         visualDensity: const VisualDensity(
              //           horizontal: 2,
              //           vertical: -4,
              //         ),
              //         padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              //         backgroundColor: AppColors.v6,
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide(
              //             color: Colors.transparent,
              //           ),
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //         label: Text(
              //           '전체',
              //           style: FontStyles.Caption1_m.copyWith(
              //               color: AppColors.white),
              //         ),
              //       ),
              //     ),
              //     Tab(
              //       child: Chip(
              //         visualDensity: const VisualDensity(
              //           horizontal: 2,
              //           vertical: -4,
              //         ),
              //         padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              //         backgroundColor: AppColors.v6,
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide(
              //             color: Colors.transparent,
              //           ),
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //         label: Text(
              //           '찬성',
              //           style: FontStyles.Caption1_m.copyWith(
              //               color: AppColors.white),
              //         ),
              //       ),
              //     ),
              //     Tab(
              //       child: Chip(
              //         visualDensity: const VisualDensity(
              //           horizontal: 2,
              //           vertical: -4,
              //         ),
              //         padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              //         backgroundColor: AppColors.v6,
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide(
              //             color: Colors.transparent,
              //           ),
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //         label: Text(
              //           '반대',
              //           style: FontStyles.Caption1_m.copyWith(
              //               color: AppColors.white),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '댓글  ',
                        style: FontStyles.Headline2_b.copyWith(
                            color: AppColors.black),
                      ),
                      TextSpan(
                        text: '16',
                        style: FontStyles.Headline2_r.copyWith(
                            color: AppColors.g3),
                      )
                    ],
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  CommentWidget(),
                  CommentWidget(),
                  CommentWidget(),
                  CommentWidget(),
                  CommentWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
