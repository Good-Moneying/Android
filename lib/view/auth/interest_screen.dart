import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/progress_bar.dart';
import '../../routes/get_pages.dart';

class InterestScreen extends GetView<UserViewModel> {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            'assets/icons/back_left.svg',
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //진행률 바
            MyProgressBar(
              percent: controller.getPercentProgress.value,
              backgroundColor: AppColors.g1,
              progressColor: AppColors.v5,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: controller.nicknameController.value.text,
                    style: FontStyles.Title2_b.copyWith(color: AppColors.v6),
                  ),
                  TextSpan(
                    text: '님의',
                    style: FontStyles.Title2_m.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
            Text(
              '관심사를 알려주세요',
              style: FontStyles.Title2_m.copyWith(color: AppColors.black),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                '관심사와 관련된 뉴스레터를 받아보세요!',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(0);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[0]
                              ? 'assets/icons/stock_fill.png'
                              : 'assets/icons/stock_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '글로벌',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(1);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[1]
                              ? 'assets/icons/finance_fill.png'
                              : 'assets/icons/finance_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '금융',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(2);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[2]
                              ? 'assets/icons/interestrate_fill.png'
                              : 'assets/icons/interestrate_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '증권',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(3);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[3]
                              ? 'assets/icons/estate_fill.png'
                              : 'assets/icons/estate_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '부동산',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(4);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[4]
                              ? 'assets/icons/corporation_fill.png'
                              : 'assets/icons/corporation_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '기업',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(5);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[5]
                              ? 'assets/icons/tech_fill.png'
                              : 'assets/icons/tech_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '테크',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(6);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[6]
                              ? 'assets/icons/life_fill.png'
                              : 'assets/icons/life_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '라이프',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                        controller.selectInterest(7);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[7]
                              ? 'assets/icons/policy_fill.png'
                              : 'assets/icons/policy_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '정책',
                            style:
                                FontStyles.Br1_sb.copyWith(color: AppColors.g4),
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
                      Image.asset(
                        'assets/icons/policy_unfill.png',
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Obx(
              () => ElevatedButton(
                onPressed: controller.interestSelect.value == false
                    ? null
                    : () {
                        Get.toNamed(Routes.FREQUENCY);
                        controller.setEnabled(1.0);
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: AppColors.v6,
                ),
                child: Text(
                  '다음',
                  style: FontStyles.Bn1_b.copyWith(
                      color: controller.interestSelect.value == false
                          ? const Color(0xFFAAAAB9)
                          : AppColors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
