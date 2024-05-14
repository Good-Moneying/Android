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
            padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //진행률 바
            MyProgressBar(percent: controller.getPercentProgress.value),
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
                          Image.asset(controller.interestList[0]
                              ? 'assets/icons/stock_fill.png'
                              : 'assets/icons/stock_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '주식',
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
                        controller.selectInterest(1);
                      },
                      child: Column(
                        children: [
                          Image.asset(controller.interestList[1]
                              ? 'assets/icons/coin_fill.png'
                              : 'assets/icons/coin_unfill.png'),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            '코인',
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
                            '금리',
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
