import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/view/auth/welcome_screen.dart';
import 'package:meetup/viewModel/user_viewModel.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../design/widgets/progress_bar.dart';
import '../../routes/get_pages.dart';

class FrequencyScreen extends GetView<UserViewModel> {
  const FrequencyScreen({super.key});

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
                      text: '뉴스레터',
                      style: FontStyles.Title2_b.copyWith(color: AppColors.v6),
                    ),
                    TextSpan(
                      text: '를',
                      style:
                          FontStyles.Title2_m.copyWith(color: AppColors.black),
                    )
                  ],
                ),
              ),
              Text(
                '얼마나 자주 읽고 싶으신가요',
                style: FontStyles.Title2_m.copyWith(color: AppColors.black),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                '꾸준한 습관을 만들 수 있게 도와드릴게요!',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
              ),
              SizedBox(height: Get.height * 0.1),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Obx(
                  () => OutlinedButton(
                    onPressed: () {
                      Get.to(
                          WelcomeScreen(),
                      duration: Duration(milliseconds: 1500),
                      );
                      controller.selectFrequency(0);
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: controller.frequencyList[0]
                            ? AppColors.v1
                            : AppColors.white,
                        side: BorderSide(
                          color: controller.frequencyList[0]
                              ? AppColors.v6
                              : AppColors.g3,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      '매일',
                      style: FontStyles.Bn2_sb.copyWith(
                        color: controller.frequencyList[0]
                            ? AppColors.v6
                            : AppColors.g4,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Obx(
                  () => OutlinedButton(
                    onPressed: () {
                      Get.to(
                        WelcomeScreen(),
                        duration: Duration(milliseconds: 1500),
                      );
                      controller.selectFrequency(1);
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: controller.frequencyList[1]
                            ? AppColors.v1
                            : AppColors.white,
                        side: BorderSide(
                          color: controller.frequencyList[1]
                              ? AppColors.v6
                              : AppColors.g3,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      '일주일에 5~6번',
                      style: FontStyles.Bn2_sb.copyWith(
                        color: controller.frequencyList[1]
                            ? AppColors.v6
                            : AppColors.g4,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Obx(
                  () => OutlinedButton(
                    onPressed: () {
                      Get.to(
                        WelcomeScreen(),
                        duration: Duration(milliseconds: 1500),
                      );
                      controller.selectFrequency(2);
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: controller.frequencyList[2]
                            ? AppColors.v1
                            : AppColors.white,
                        side: BorderSide(
                          color: controller.frequencyList[2]
                              ? AppColors.v6
                              : AppColors.g3,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      '일주일에 3~4번',
                      style: FontStyles.Bn2_sb.copyWith(
                        color: controller.frequencyList[2]
                            ? AppColors.v6
                            : AppColors.g4,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Obx(
                  () => OutlinedButton(
                    onPressed: () {
                      Get.to(
                        WelcomeScreen(),
                        duration: Duration(milliseconds: 1500),
                      );
                      controller.selectFrequency(3);
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: controller.frequencyList[3]
                            ? AppColors.v1
                            : AppColors.white,
                        side: BorderSide(
                          color: controller.frequencyList[3]
                              ? AppColors.v6
                              : AppColors.g3,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      '일주일에 1~2번',
                      style: FontStyles.Bn2_sb.copyWith(
                        color: controller.frequencyList[3]
                            ? AppColors.v6
                            : AppColors.g4,
                      ),
                    ),
                  ),
                ),
              ),
              //건너뛰기 버튼
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Get.to(
                      WelcomeScreen(),
                      duration: Duration(milliseconds: 1500),
                    );
                    controller.resetFrequency();
                  },
                  child: Text(
                    '건너뛰기',
                    style: FontStyles.Lr1_m.copyWith(
                      color: AppColors.g3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
