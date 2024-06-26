import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';


class CommentWidget extends StatelessWidget {
  final String writer;
  final String time;
  final String perspective;
  final String content;
  final Widget onFollow;
  final Widget onLike;



  const CommentWidget({
    super.key,
    required this.writer,
    required this.time,
    required this.content,
    required this.perspective,
    required this.onFollow,
    required this.onLike,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              writer,
                              style: FontStyles.Caption1_m.copyWith(
                                  color: AppColors.black
                              ),
                            ),
                          ),
                          onFollow,
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Level 1 • ',
                          style: FontStyles.Caption2_r.copyWith(
                              color: AppColors.g4),
                        ),
                        Text(
                          time,
                          style: FontStyles.Caption2_r.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                onLike,
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 4.0),
                //       child: SvgPicture.asset('assets/icons/like_comment.svg'),
                //     ),
                //     Text(
                //       '27',
                //       style: FontStyles.Caption2_m.copyWith(color: AppColors.g3),
                //     ),
                //   ],
                // ),
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
              padding: const EdgeInsets.all(16),
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
