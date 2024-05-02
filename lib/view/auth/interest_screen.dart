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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            //진행률 바
            MyProgressBar(percent: controller.getPercentProgress.value),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              '3/4',
              style: FontStyles.Headline1_m.copyWith(color: AppColors.y6),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '김두둑',
                    style: FontStyles.Title2_b.copyWith(color: AppColors.v5),
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
            Text(
              '관심사와 관련된 뉴스레터를 받아보세요!',
              style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
            ),
            SizedBox(
              height: Get.height * 0.1,
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
                          SvgPicture.asset(controller.interestList[0]
                              ? 'assets/icons/interest_fill.svg'
                              : 'assets/icons/interest_unfill.svg'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
                            style: FontStyles.Bn2_sb.copyWith(
                                color: controller.interestList[0]
                                    ? AppColors.black
                                    : AppColors.g4),
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
                          SvgPicture.asset(controller.interestList[1]
                              ? 'assets/icons/interest_fill.svg'
                              : 'assets/icons/interest_unfill.svg'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
                            style: FontStyles.Bn2_sb.copyWith(
                                color: controller.interestList[1]
                                    ? AppColors.black
                                    : AppColors.g4),
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
                          SvgPicture.asset(controller.interestList[2]
                              ? 'assets/icons/interest_fill.svg'
                              : 'assets/icons/interest_unfill.svg'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
                            style: FontStyles.Bn2_sb.copyWith(
                                color: controller.interestList[2]
                                    ? AppColors.black
                                    : AppColors.g4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
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
                          SvgPicture.asset(controller.interestList[3]
                              ? 'assets/icons/interest_fill.svg'
                              : 'assets/icons/interest_unfill.svg'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
                            style: FontStyles.Bn2_sb.copyWith(
                                color: controller.interestList[3]
                                    ? AppColors.black
                                    : AppColors.g4),
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
                          SvgPicture.asset(controller.interestList[4]
                              ? 'assets/icons/interest_fill.svg'
                              : 'assets/icons/interest_unfill.svg'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
                            style: FontStyles.Bn2_sb.copyWith(
                                color: controller.interestList[4]
                                    ? AppColors.black
                                    : AppColors.g4),
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
                          SvgPicture.asset(controller.interestList[5]
                              ? 'assets/icons/interest_fill.svg'
                              : 'assets/icons/interest_unfill.svg'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
                            style: FontStyles.Bn2_sb.copyWith(
                                color: controller.interestList[5]
                                    ? AppColors.black
                                    : AppColors.g4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.FREQUENCY);
                controller.setEnabled(1.0);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColors.v5,
              ),
              child: Text(
                '다음',
                style: FontStyles.Bn1_b.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
