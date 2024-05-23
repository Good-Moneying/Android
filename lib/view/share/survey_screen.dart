import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/comment_widget.dart';
import 'package:meetup/view/bottomNavigationBar.dart';
import 'package:meetup/viewModel/survey_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/home/news_slider.dart';

final surveyController = Get.find<SurveyViewModel>();

class SurveyScreen extends GetView<SurveyViewModel> {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SurveyViewModel());
    controller.startAnimation();
    return Scaffold(
      backgroundColor: AppColors.g6,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.offAll(BottomNavigationView());
          },
          icon: SvgPicture.asset(
            'assets/icons/back_left.svg',
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 16.0),
              child: Text(
                '오늘의 설문',
                style: FontStyles.Headline2_b.copyWith(color: AppColors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 12.0, bottom: 18.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(
                        newsController.homeModel?.customizeNewsLetters[0].thumbnail ?? 'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                        height: Get.height * 0.08,
                        width: Get.width * 0.17,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: AnimatedBuilder(
                                  animation: controller.animation,
                                  builder: (context, child) {
                                    return Container(
                                      height: Get.height*controller.animation.value*0.18,
                                      decoration: BoxDecoration(
                                        color: AppColors.v5,
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

                                            Text(
                                              '찬성',
                                              style: FontStyles.Caption1_m.copyWith(
                                                  color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                flex: 1,
                                child:
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: AppColors.white,
                                //     border: Border.all(
                                //       color: AppColors.v2,
                                //       width: 1,
                                //     ),
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   child: Padding(
                                //     padding:
                                //         const EdgeInsets.fromLTRB(14, 1, 14, 8),
                                //     child: Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         Image.asset(
                                //             'assets/icons/disagreement.png'),
                                //         Text(
                                //           '반대',
                                //           style: FontStyles.Caption1_m.copyWith(
                                //               color: AppColors.black),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: AppColors.v3,
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
                                              color: AppColors.v5),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 39.0),
              child: Container(
                color: AppColors.white,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
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
                      Obx(
                          () => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.allComment(true);
                                  controller.agreeComment(false);
                                  controller.disagreeComment(false);
                                },
                                child: Card(
                                  color: controller.allComment.value ? AppColors.v6 : AppColors.g1,
                                  surfaceTintColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Text(
                                      '전체',
                                      style: FontStyles.Caption1_m.copyWith(
                                          color:
                                          controller.allComment.value ?
                                          AppColors.white : AppColors.g4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.allComment(false);
                                  controller.agreeComment(true);
                                  controller.disagreeComment(false);
                                },
                                child: Card(
                                  color: controller.agreeComment.value ? AppColors.v6 : AppColors.g1,
                                  surfaceTintColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Text(
                                      '찬성',
                                      style: FontStyles.Caption1_m.copyWith(
                                          color: controller.agreeComment.value ?
                                          AppColors.white : AppColors.g4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.allComment(false);
                                  controller.agreeComment(false);
                                  controller.disagreeComment(true);
                                },
                                child: Card(
                                  color: controller.disagreeComment.value ? AppColors.v6 : AppColors.g1,
                                  surfaceTintColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Text(
                                      '반대',
                                      style: FontStyles.Caption1_m.copyWith(
                                          color: controller.disagreeComment.value ?
                                          AppColors.white : AppColors.g4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                '인기순',
                                style: FontStyles.Caption1_m.copyWith(
                                    color: AppColors.g4),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/view_bottom.svg'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Obx(
                          () {
                            if (controller.allComment.value) {
                              return _allComment();
                            } else if (controller.agreeComment.value) {
                              return _agreeComment();
                            } else {
                              return _disagreeComment();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_allComment() {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Obx(
        () => CommentWidget(
          writer: '수현',
          time: '방금 전',
          content: Get.arguments ?? '전기차는 환경을 보호하는 가장 효과적인 방법 중 하나로, 낮은 탄소 배출로 지구 온난화를 완화할 수 있습니다.',
          perspective: '찬성',
          onFollow: ElevatedButton(
            onPressed: () {
              if (surveyController.isFollow.value == false) {
                surveyController.isFollow(true);
              } else {
                surveyController.isFollow(false);
              }
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              backgroundColor:
                  surveyController.isFollow.value ? AppColors.g2 : AppColors.g6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              surveyController.isFollow.value ? '팔로잉' : '팔로우',
              style: FontStyles.Caption2_m.copyWith(
                  color: surveyController.isFollow.value
                      ? AppColors.g5
                      : AppColors.white),
            ),
          ),
          onLike: GestureDetector(
            onTap: () {
              if (surveyController.isLike.value == false) {
                surveyController.isLike(true);
              } else {
                surveyController.isLike(false);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  //라이크 코멘트 색 채워졌을 때 필요함
                  child: SvgPicture.asset(surveyController.isLike.value
                      ? 'assets/icons/like_comment.svg'
                      : 'assets/icons/unlike_comment.svg'),
                ),
                Text(
                  surveyController.isLike.value ? '1' : '0',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
        ),
      ),
      Obx(
        () => CommentWidget(
          writer: '데헌',
          time: '1시간 전',
          content: '전기차는 유지비가 저렴하고, 정부 지원으로 인해 더욱 경제적이게 이용할 수 있습니다.',
          perspective: '반대',
          onFollow: ElevatedButton(
            onPressed: () {
              if (surveyController.isFollow2.value == false) {
                surveyController.isFollow2(true);
              } else {
                surveyController.isFollow2(false);
              }
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              backgroundColor: surveyController.isFollow2.value
                  ? AppColors.g2
                  : AppColors.g6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              surveyController.isFollow2.value ? '팔로잉' : '팔로우',
              style: FontStyles.Caption2_m.copyWith(
                  color: surveyController.isFollow2.value
                      ? AppColors.g5
                      : AppColors.white),
            ),
          ),
          onLike: GestureDetector(
            onTap: () {
              if (surveyController.isLike2.value == false) {
                surveyController.isLike2(true);
              } else {
                surveyController.isLike2(false);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  //라이크 코멘트 색 채워졌을 때 필요함
                  child: SvgPicture.asset(surveyController.isLike2.value
                      ? 'assets/icons/like_comment.svg'
                      : 'assets/icons/unlike_comment.svg'),
                ),
                Text(
                  surveyController.isLike2.value ? '21' : '20',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
        ),
      ),
      Obx(
        () => CommentWidget(
          writer: '건우백',
          time: '10분 전',
          content:
              '하지만 비슷하게 긴축에 나섰던 다른 주요국들이 경제 침체를 겪는 동안, 미국은 상대적으로 경제 호황을 누리고 있어요.',
          perspective: '찬성',
          onFollow: ElevatedButton(
            onPressed: () {
              if (surveyController.isFollow3.value == false) {
                surveyController.isFollow3(true);
              } else {
                surveyController.isFollow3(false);
              }
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              backgroundColor: surveyController.isFollow3.value
                  ? AppColors.g2
                  : AppColors.g6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              surveyController.isFollow3.value ? '팔로잉' : '팔로우',
              style: FontStyles.Caption2_m.copyWith(
                  color: surveyController.isFollow3.value
                      ? AppColors.g5
                      : AppColors.white),
            ),
          ),
          onLike: GestureDetector(
            onTap: () {
              if (surveyController.isLike3.value == false) {
                surveyController.isLike3(true);
              } else {
                surveyController.isLike3(false);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  //라이크 코멘트 색 채워졌을 때 필요함
                  child: SvgPicture.asset(surveyController.isLike3.value
                      ? 'assets/icons/like_comment.svg'
                      : 'assets/icons/unlike_comment.svg'),
                ),
                Text(
                  surveyController.isLike3.value ? '11' : '10',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

_agreeComment() {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Obx(
        () => CommentWidget(
          writer: '수현',
          time: '방금 전',
          content: Get.arguments ?? '전기차는 환경을 보호하는 가장 효과적인 방법 중 하나로, 낮은 탄소 배출로 지구 온난화를 완화할 수 있습니다.',
          perspective: '찬성',
          onFollow: ElevatedButton(
            onPressed: () {
              if (surveyController.isFollow.value == false) {
                surveyController.isFollow(true);
              } else {
                surveyController.isFollow(false);
              }
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              backgroundColor:
                  surveyController.isFollow.value ? AppColors.g2 : AppColors.g6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              surveyController.isFollow.value ? '팔로잉' : '팔로우',
              style: FontStyles.Caption2_m.copyWith(
                  color: surveyController.isFollow.value
                      ? AppColors.g5
                      : AppColors.white),
            ),
          ),
          onLike: GestureDetector(
            onTap: () {
              if (surveyController.isLike.value == false) {
                surveyController.isLike(true);
              } else {
                surveyController.isLike(false);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  //라이크 코멘트 색 채워졌을 때 필요함
                  child: SvgPicture.asset(surveyController.isLike.value
                      ? 'assets/icons/like_comment.svg'
                      : 'assets/icons/unlike_comment.svg'),
                ),
                Text(
                  surveyController.isLike.value ? '1' : '0',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
        ),
      ),
      Obx(
        () => CommentWidget(
          writer: '건우백',
          time: '10분 전',
          content:
              '하지만 비슷하게 긴축에 나섰던 다른 주요국들이 경제 침체를 겪는 동안, 미국은 상대적으로 경제 호황을 누리고 있어요.',
          perspective: '찬성',
          onFollow: ElevatedButton(
            onPressed: () {
              if (surveyController.isFollow3.value == false) {
                surveyController.isFollow3(true);
              } else {
                surveyController.isFollow3(false);
              }
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              backgroundColor: surveyController.isFollow3.value
                  ? AppColors.g2
                  : AppColors.g6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              surveyController.isFollow3.value ? '팔로잉' : '팔로우',
              style: FontStyles.Caption2_m.copyWith(
                  color: surveyController.isFollow3.value
                      ? AppColors.g5
                      : AppColors.white),
            ),
          ),
          onLike: GestureDetector(
            onTap: () {
              if (surveyController.isLike3.value == false) {
                surveyController.isLike3(true);
              } else {
                surveyController.isLike3(false);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  //라이크 코멘트 색 채워졌을 때 필요함
                  child: SvgPicture.asset(surveyController.isLike3.value
                      ? 'assets/icons/like_comment.svg'
                      : 'assets/icons/unlike_comment.svg'),
                ),
                Text(
                  surveyController.isLike3.value ? '11' : '10',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

_disagreeComment() {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Obx(
        () => CommentWidget(
          writer: '데헌',
          time: '1시간 전',
          content: '전기차는 유지비가 저렴하고, 정부 지원으로 인해 더욱 경제적이게 이용할 수 있습니다.',
          perspective: '반대',
          onFollow: ElevatedButton(
            onPressed: () {
              if (surveyController.isFollow2.value == false) {
                surveyController.isFollow2(true);
              } else {
                surveyController.isFollow2(false);
              }
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              backgroundColor: surveyController.isFollow2.value
                  ? AppColors.g2
                  : AppColors.g6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              surveyController.isFollow2.value ? '팔로잉' : '팔로우',
              style: FontStyles.Caption2_m.copyWith(
                  color: surveyController.isFollow2.value
                      ? AppColors.g5
                      : AppColors.white),
            ),
          ),
          onLike: GestureDetector(
            onTap: () {
              if (surveyController.isLike2.value == false) {
                surveyController.isLike2(true);
              } else {
                surveyController.isLike2(false);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  //라이크 코멘트 색 채워졌을 때 필요함
                  child: SvgPicture.asset(surveyController.isLike2.value
                      ? 'assets/icons/like_comment.svg'
                      : 'assets/icons/unlike_comment.svg'),
                ),
                Text(
                  surveyController.isLike2.value ? '21' : '20',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
