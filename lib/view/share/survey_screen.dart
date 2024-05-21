import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/widgets/appBar/back_appBar.dart';
import 'package:meetup/design/widgets/comment_widget.dart';
import 'package:meetup/viewModel/survey_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';

class SurveyScreen extends GetView<SurveyViewModel> {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SurveyViewModel());

    return Scaffold(
      backgroundColor: AppColors.g6,
      appBar: BackAppBar(
        iconColor: AppColors.white,
        title: null,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 39.0),
              child: Container(
                color: AppColors.white,
                width: Get.width,
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Card(
                              color: AppColors.v6,
                              surfaceTintColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Text(
                                  '전체',
                                  style: FontStyles.Caption1_m.copyWith(
                                      color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Card(
                              color: AppColors.g1,
                              surfaceTintColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Text(
                                  '찬성',
                                  style: FontStyles.Caption1_m.copyWith(
                                      color: AppColors.g4),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Card(
                              color: AppColors.g1,
                              surfaceTintColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Text(
                                  '반대',
                                  style: FontStyles.Caption1_m.copyWith(
                                      color: AppColors.g4),
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
                          SvgPicture.asset('assets/icons/view_more.svg'),
                        ],
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Obx(
                            () => CommentWidget(
                              writer: '연디',
                              time: '5분 전',
                              content:
                                  '전기차는 환경을 보호하는 가장 효과적인 방법 중 하나로, 낮은 탄소 배출로 지구 온난화를 완화할 수 있습니다.',
                              perspective: '찬성',
                              onFollow: ElevatedButton(
                                onPressed: () {
                                  if (controller.isFollow.value == false) {
                                    controller.isFollow(true);
                                  } else {
                                    controller.isFollow(false);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 8, vertical: 2),
                                  backgroundColor: controller.isFollow.value
                                      ? AppColors.g2
                                      : AppColors.g6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  controller.isFollow.value ? '팔로잉' : '팔로우',
                                  style: FontStyles.Caption2_m.copyWith(
                                      color: controller.isFollow.value
                                          ? AppColors.g5
                                          : AppColors.white),
                                ),
                              ),
                              onLike: GestureDetector(
                                onTap: () {
                                  if (controller.isLike.value == false) {
                                    controller.isLike(true);
                                  } else {
                                    controller.isLike(false);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      //라이크 코멘트 색 채워졌을 때 필요함
                                      child: SvgPicture.asset(controller
                                              .isLike.value
                                          ? 'assets/icons/like_comment.svg'
                                          : 'assets/icons/unlike_comment.svg'),
                                    ),
                                    Text(
                                      controller.isLike.value ? '28' : '27',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color: AppColors.g3),
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
                              content:
                                  '전기차는 유지비가 저렴하고, 정부 지원으로 인해 더욱 경제적이게 이용할 수 있습니다.',
                              perspective: '반대',
                              onFollow: ElevatedButton(
                                onPressed: () {
                                  if (controller.isFollow.value == false) {
                                    controller.isFollow(true);
                                  } else {
                                    controller.isFollow(false);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 8, vertical: 2),
                                  backgroundColor: controller.isFollow.value
                                      ? AppColors.g2
                                      : AppColors.g6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  controller.isFollow.value ? '팔로잉' : '팔로우',
                                  style: FontStyles.Caption2_m.copyWith(
                                      color: controller.isFollow.value
                                          ? AppColors.g5
                                          : AppColors.white),
                                ),
                              ),
                              onLike: GestureDetector(
                                onTap: () {
                                  if (controller.isLike.value == false) {
                                    controller.isLike(true);
                                  } else {
                                    controller.isLike(false);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      //라이크 코멘트 색 채워졌을 때 필요함
                                      child: SvgPicture.asset(controller
                                              .isLike.value
                                          ? 'assets/icons/like_comment.svg'
                                          : 'assets/icons/unlike_comment.svg'),
                                    ),
                                    Text(
                                      controller.isLike.value ? '28' : '27',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color: AppColors.g3),
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
                              perspective: '반대',
                              onFollow: ElevatedButton(
                                onPressed: () {
                                  if (controller.isFollow.value == false) {
                                    controller.isFollow(true);
                                  } else {
                                    controller.isFollow(false);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 8, vertical: 2),
                                  backgroundColor: controller.isFollow.value
                                      ? AppColors.g2
                                      : AppColors.g6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  controller.isFollow.value ? '팔로잉' : '팔로우',
                                  style: FontStyles.Caption2_m.copyWith(
                                      color: controller.isFollow.value
                                          ? AppColors.g5
                                          : AppColors.white),
                                ),
                              ),
                              onLike: GestureDetector(
                                onTap: () {
                                  if (controller.isLike.value == false) {
                                    controller.isLike(true);
                                  } else {
                                    controller.isLike(false);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 4.0),
                                      //라이크 코멘트 색 채워졌을 때 필요함
                                      child: SvgPicture.asset(controller
                                          .isLike.value
                                          ? 'assets/icons/like_comment.svg'
                                          : 'assets/icons/unlike_comment.svg'),
                                    ),
                                    Text(
                                      controller.isLike.value ? '28' : '27',
                                      style: FontStyles.Caption2_m.copyWith(
                                          color: AppColors.g3),
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
