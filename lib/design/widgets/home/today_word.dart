import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';
import '../chip_editor.dart';

class TodayWord extends StatelessWidget {
  const TodayWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  '테슬라 요건',
                  style:
                  FontStyles.Bn1_b.copyWith(color: AppColors.v6),
                ),
                CustomChip(label: '기업'),
                Spacer(),
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
            Text(
              'Tesla’s requirements',
              style: FontStyles.Ln1_m.copyWith(color: AppColors.g3),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            //뜻
            RichText(
              maxLines: 3,
              softWrap: true,
              text: TextSpan(
                text:
                '주식 시장에 상장하기 위한 요건을 갖추기 못한 기업들 중에서 잠재력이 큰 곳들을 골라 상장 기회를 주는 제도에요!',
                style: FontStyles.Bn1_r.copyWith(
                    color: AppColors.g5, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
