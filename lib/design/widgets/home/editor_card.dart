import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/get_pages.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';
import '../chip_editor.dart';
import '../history_widget.dart';

class EditorCard extends StatelessWidget {
  const EditorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.EDITORNEWS);
      },
      child: Card(
        color: AppColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    //임시 사진
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg',
                      height: Get.height * 0.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 13,
                    right: 16,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.5),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                          ),
                        ),
                        SvgPicture.asset(
                            'assets/icons/bookmark_unfill.svg'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  '테슬라 주가 갑자기 오른 이유는?',
                  style: FontStyles.Headline2_b.copyWith(
                      color: AppColors.black),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomChip(label: '미국경제'),
                  CustomChip(label: '금리'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                    child: History(),
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
