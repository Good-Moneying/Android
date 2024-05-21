import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';

import '../../../routes/get_pages.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

class PlusMainContainer extends StatelessWidget {
  final String? comment;
  final String? thumbnailUrl;
  final String? summarizedComment;
  final String? tag;

  const PlusMainContainer({
    super.key,
    this.comment,
    this.thumbnailUrl,
    this.summarizedComment,
    this.tag
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, ),
      child: Container(
        width: 387,
        height: 275,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, // AppColors.white를 Colors.white로 대체
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    if (thumbnailUrl != null)
                      Image.network(
                        thumbnailUrl!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.fitWidth,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return CircularProgressIndicator(); // 이미지 로딩 중이면 로딩 스피너 표시
                          }
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Text('Failed to load image'); // 이미지 로딩에 실패하면 에러 메시지 표시
                        },
                      )
                    else
                      Image.asset(
                        'assets/icons/plus_te.png',
                        width: 70,
                        height: 70,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              comment ?? 'null',
                              style: FontStyles.Ln1_sb.copyWith(color: AppColors.black),
                              overflow: TextOverflow.visible,
                              softWrap: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: badges.Badge(
                              badgeContent: Text(
                                tag ?? 'null',
                                style: FontStyles.Caption2_m.copyWith(color: AppColors.v5),
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.square,
                                borderRadius: BorderRadius.circular(5), // 둥근 모서리 설정
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4), // 배지 내부 여백 설정
                                badgeColor: AppColors.v1, // 배지 배경색 설정
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    width: 360,
                    height: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.g1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        summarizedComment ?? '코멘트 없음',
                        style: FontStyles.Caption2_r.copyWith(color: AppColors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/plus_time.svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        '1분 전',
                        style: FontStyles.Caption2_r.copyWith(color: AppColors.g4),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PLUSONBOARDING);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          width: 104,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: AppColors.v6,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('생각더하기',style: FontStyles.Label2_sb.copyWith(color: AppColors.white),),
                                SvgPicture.asset('assets/icons/plus_arrow2.svg')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
