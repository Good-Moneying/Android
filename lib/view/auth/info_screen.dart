import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../design/style/FontStyles.dart';
import '../../design/widgets/progress_bar.dart';
import '../../routes/get_pages.dart';

class InfoScreen extends GetView<UserViewModel> {
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
                '2/4',
                style: FontStyles.Headline1_m.copyWith(color: AppColors.y6),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '00',
                      style: FontStyles.Title2_b.copyWith(color: AppColors.v5),
                    ),
                    TextSpan(
                      text: '님의',
                      style:
                          FontStyles.Title2_m.copyWith(color: AppColors.black),
                    )
                  ],
                ),
              ),
              Text(
                '기본 정보를 알려주세요',
                style: FontStyles.Title2_m.copyWith(color: AppColors.black),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                '다양한 맞춤 정보를 추천해드릴게요!',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
              ),
              Text(
                '*기본 정보는 외부에 노출되지 않아요.',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '성별',
                  style: FontStyles.Bn2_sb.copyWith(color: AppColors.black),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Obx(
                      () => OutlinedButton(
                        onPressed: () {
                          controller.selectGender(0);
                        },
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: controller.genderList[0]
                                ? AppColors.v1
                                : AppColors.white,
                            side: BorderSide(
                              color: controller.genderList[0]
                                  ? AppColors.v5
                                  : AppColors.g3,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Text(
                          '남자',
                          style: FontStyles.Bn2_sb.copyWith(
                            color: controller.genderList[0]
                                ? AppColors.v5
                                : AppColors.g4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Obx(
                      () => OutlinedButton(
                        onPressed: () {
                          controller.selectGender(1);
                        },
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: controller.genderList[1]
                                ? AppColors.v1
                                : AppColors.white,
                            side: BorderSide(
                              color: controller.genderList[1]
                                  ? AppColors.v5
                                  : AppColors.g3,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Text(
                          '여자',
                          style: FontStyles.Bn2_sb.copyWith(
                            color: controller.genderList[1]
                                ? AppColors.v5
                                : AppColors.g4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '생년월일',
                  style: FontStyles.Bn2_sb.copyWith(color: AppColors.black),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => InkWell(
                        onTap: () async {
                          controller.selectedDate.value = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now()) ??
                              controller.selectedDate.value;
                        },
                        child: Container(
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.g2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                            child: Text(
                              controller.selectedDate.value == null
                                  ? '생년월일을 선택해주세요'
                                  : '${controller.selectedDate.value?.year.toString()}/${controller.selectedDate.value?.month.toString().padLeft(2, '0')}/${controller.selectedDate.value?.day.toString().padLeft(2, '0')}',
                              style: FontStyles.Ln1_m.copyWith(
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                    width: Get.width * 0.25,
                    child: ElevatedButton(
                      onPressed: () {
                        //
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.g6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        '선택하기',
                        style:
                            FontStyles.Bn2_sb.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.INTEREST);
                    controller.setEnabled(0.77);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
