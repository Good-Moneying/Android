import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/get_pages.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';
import '../custom_button.dart';

class TermDialog extends StatelessWidget {
  const TermDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      titlePadding: EdgeInsets.only(right: 16.0),
      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 32),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
                'assets/images/newsletter_close.svg'), // 닫기 아이콘
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RichText(
              text: TextSpan(
                text: '오늘의 단어를 ',
                style: FontStyles.Headline1_b.copyWith(color: AppColors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: '저장',
                    style: FontStyles.Headline1_b.copyWith(
                        color: AppColors.v5),
                  ),
                  TextSpan(
                    text: '했어요!',
                    style: FontStyles.Headline1_b.copyWith(
                        color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Text('마이페이지 > 나의 단어장에서 확인해보세요.',
            style: FontStyles.Caption1_m.copyWith(color: AppColors.g4),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Image.asset('assets/icons/plus_cloudfun.png'),
          ),
          CustomButton(
            backgroundColor: AppColors.v6,
            textStyle: FontStyles.Ln1_sb.copyWith(color: AppColors.white),
            label: '나의 단어장 확인하기',
            onPressed: () {
              //네비바
              Get.toNamed(Routes.PROFILE);
            },
          ),
        ],
      ),
    );
  }
}
