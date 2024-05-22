import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';
import '../chip_editor.dart';

class TodayWord extends StatelessWidget {
  final String title;
  final String engTitle;
  final String meaning;
  final String category;
  final bool isBookMark;
  final Function() onBookMark;

  const TodayWord({
    super.key,
    required this.title,
    required this.engTitle,
    required this.meaning,
    required this.category,
    required this.isBookMark,
    required this.onBookMark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    title,
                    style: FontStyles.Bn1_b.copyWith(color: AppColors.v6),
                  ),
                ),
                CustomChip(label: category),
                Spacer(),
                GestureDetector(
                  onTap: onBookMark,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          border: Border.all(
                            color: AppColors.g2.withOpacity(0.3),
                          ),
                        ),
                      ),
                      SvgPicture.asset(isBookMark
                          ? 'assets/icons/bookmark_fill.svg'
                          : 'assets/icons/bookmark_unfill.svg'),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              engTitle,
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
                text: meaning,
                style:
                    FontStyles.Bn1_r.copyWith(color: AppColors.g5, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
