import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meetup/viewModel/home_viewModel.dart';

import '../../../viewModel/user_viewModel.dart';
import '../../style/ColorStyles.dart';
import '../../style/FontStyles.dart';
import '../custom_button.dart';


class ArchiveDialog extends StatelessWidget {
  const ArchiveDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final userController = Get.find<UserViewModel>();

    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 32),
      title: Column(
        children: [
          SizedBox(height: 10,),
          Row(
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
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RichText(
              text: TextSpan(
                text: '뉴스레터를 ',
                style: FontStyles.Headline1_b.copyWith(color: AppColors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: '저장할 폴더',
                    style: FontStyles.Headline1_b.copyWith(
                        color: AppColors.v5),
                  ),
                  TextSpan(
                    text: '를 선택해주세요!',
                    style: FontStyles.Headline1_b.copyWith(
                        color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          //1열
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(0);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[0]
                            ? 'assets/icons/stock_fill.png'
                            : 'assets/icons/stock_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '글로벌',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(1);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[1]
                            ? 'assets/icons/finance_fill.png'
                            : 'assets/icons/finance_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '금융',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(2);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[2]
                            ? 'assets/icons/interestrate_fill.png'
                            : 'assets/icons/interestrate_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '증권',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          //2열
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(3);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[3]
                            ? 'assets/icons/estate_fill.png'
                            : 'assets/icons/estate_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '부동산',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(4);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[4]
                            ? 'assets/icons/corporation_fill.png'
                            : 'assets/icons/corporation_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '기업',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(5);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[5]
                            ? 'assets/icons/tech_fill.png'
                            : 'assets/icons/tech_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '테크',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          //3열
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(6);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[6]
                            ? 'assets/icons/life_fill.png'
                            : 'assets/icons/life_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '라이프',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Obx(
                      () => InkWell(
                    onTap: () {
                      userController.selectInterest(7);
                    },
                    child: Column(
                      children: [
                        Image.asset(userController.interestList[7]
                            ? 'assets/icons/policy_fill.png'
                            : 'assets/icons/policy_unfill.png'),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          '정책',
                          style: FontStyles.Br1_sb.copyWith(
                              color: AppColors.g4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Image.asset('assets/icons/add_interest.png'),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      '추가하기',
                      style: FontStyles.Br1_sb.copyWith(
                          color: AppColors.g4),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Obx(
            () => CustomButton(
              backgroundColor: AppColors.v6,
              textStyle: FontStyles.Ln1_sb.copyWith(
                  color: userController.interestSelect.value == false
                      ? const Color(0xFFAAAAB9)
                      : AppColors.white
              ),
              label: '완료',
              onPressed: userController.interestSelect.value == false
                  ? null
                  : () {
                //네비바
                Get.back();
                //아카이브
                //카테고리 아카이브

              },
            ),
          ),
        ],
      ),
    );
  }
}
