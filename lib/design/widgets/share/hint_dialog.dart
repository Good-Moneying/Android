import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModel/profile_viewModel.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';

final profileController = Get.find<ProfileViewModel>();

class HintDialog extends StatelessWidget {
  const HintDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(
          left: 16.0, right: 16.0, bottom: 32),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/mypage_rain.png',
            width: 29,
            height: 31,
          ),
          Text(
            "3방울",
            style: FontStyles.Headline2_b.copyWith(
                color: AppColors.v6),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 19.0, bottom: 8.0),
            child: Text(
              '방울을 사용해서 힌트를 보시겠어요?',
              style:
              FontStyles.Headline2_b.copyWith(
                  color: AppColors.black),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 17.0),
            child: Text(
              '3 방울을 사용하시면 힌트를 볼 수 있어요!',
              style: FontStyles.Caption1_m.copyWith(
                  color: AppColors.g4),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 19.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.g1,
                borderRadius:
                BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(
                        24, 14, 13, 14),
                    child: Text(
                      '현재 보유 방울',
                      style:
                      FontStyles.Ln1_m.copyWith(
                          color:
                          AppColors.black),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/icons/mypage_rain.png',
                    width: 29,
                    height: 31,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 24.0),
                    child: Text(
                      profileController.profileModel?.reward?.toString() ?? '6',
                      style:
                      FontStyles.Ln1_m.copyWith(
                          color:
                          AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                    const Size.fromHeight(50),
                    backgroundColor:
                    AppColors.white,
                    side: BorderSide(
                      color: AppColors.g3,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '안볼래요',
                    style:
                    FontStyles.Ln1_sb.copyWith(
                      color: Color(0xFFAAAAB9),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                      const Size.fromHeight(50),
                      backgroundColor: AppColors.g6,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            8),
                      )),
                  child: Text(
                    '힌트 볼래요',
                    style:
                    FontStyles.Ln1_sb.copyWith(
                        color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
