import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';


class CommentWidget extends StatelessWidget {
  final String perspective;
  final String content;



  const CommentWidget({
    super.key,
    required this.content,
    required this.perspective,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          //댓글 작성자 정보
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                    AssetImage('assets/icons/mypage_profile.png'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '연디',
                            style: FontStyles.Caption1_m.copyWith(
                                color: AppColors.black
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 8, vertical: 2),
                            backgroundColor: AppColors.g6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            '팔로우',
                            style: FontStyles.Caption2_m.copyWith(
                                color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Level 5 • 5분 전',
                          style: FontStyles.Caption2_r.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: SvgPicture.asset('assets/icons/like_comment.svg'),
                ),
                Text(
                  '27',
                  style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                ),
              ],
            ),
          ),
          //댓글 내용 컨테이너
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.g1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Chip(
                      visualDensity: const VisualDensity(
                        horizontal: 2,
                        vertical: -4,
                      ),
                      backgroundColor: AppColors.v1,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.v2,
                        ),
                        borderRadius: BorderRadius.circular(54),
                      ),
                      label: Text(
                        perspective,
                        style:
                        FontStyles.Caption2_sb.copyWith(color: AppColors.v6),
                      ),
                    ),
                  ),
                  Text(
                    content,
                    style:
                    FontStyles.Caption1_m.copyWith(color: AppColors.g6),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
