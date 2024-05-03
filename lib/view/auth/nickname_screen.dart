import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/design/widgets/progress_bar.dart';
import 'package:meetup/routes/get_pages.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NicknameScreen extends GetView<UserViewModel> {
  const NicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //임시적
    Get.put(UserViewModel());
    //

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
            height: 36,
            width: 36,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //진행률 바
              MyProgressBar(percent: controller.getPercentProgress.value),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                '1/4',
                style: FontStyles.Headline1_m.copyWith(color: AppColors.y6),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '두둑',
                      style: FontStyles.Title2_b.copyWith(color: AppColors.v5),
                    ),
                    TextSpan(
                      text: '에서 사용할',
                      style:
                      FontStyles.Title2_m.copyWith(color: AppColors.black),
                    )
                  ],
                ),
              ),
              Text(
                '닉네임을 알려주세요',
                style: FontStyles.Title2_m.copyWith(color: AppColors.black),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                '닉네임은 마이페이지에서 언제든 바꿀 수 있어요!',
                style: FontStyles.Ln1_m.copyWith(color: AppColors.g4),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              //텍스트 폼 필드
              Row(
                children: [
                  Expanded(
                    child: Focus(
                      onFocusChange: (focused) {
                        controller.setFocus(focused);
                        if (!focused) {
                          controller.setDisplayError(
                              !controller.isNicknameValid.value);
                        }
                      },
                      child: Obx(
                            () => Container(
                          height: Get.height * 0.1,
                          child: TextFormField(
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            controller: controller.nicknameController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              suffixIcon: controller
                                  .nicknameController.value.text.isEmpty
                                  ? null
                                  : IconButton(
                                onPressed: () {
                                  controller.nicknameController.clear();
                                },
                                icon: SvgPicture.asset(
                                  width: 17,
                                  height: 17,
                                  'assets/icons/text_clear.svg',
                                ),
                              ),
                              hintText: '닉네임을 적어주세요',
                              hintStyle: FontStyles.Ln1_m.copyWith(
                                  color: AppColors.g3),
                              errorText: controller.isDisplayError.value
                                  ? "닉네임을 사용할 수 없습니다"
                                  : "닉네임을 사용할 수 있습니다",
                              errorStyle: controller.isDisplayError.value
                                  ? FontStyles.Caption2_m.copyWith(
                                  color: Colors.red)
                                  : FontStyles.Caption2_m.copyWith(
                                  color: Colors.blue),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: controller.isDisplayError.value
                                      ? Colors.red
                                      : AppColors.g2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.v5,
                                ),
                              ),
                            ),
                            onChanged: (text) {
                              controller.checkNickname(text);
                              print("text field: $text");
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.25,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool isDuplicate = await controller
                              .isDuplicate(controller.nicknameController.text);

                          if (!isDuplicate) {
                            //중복 검사에서 걸리지 않았을 때
                          } else {
                            //중복 검사에서 걸렸을 때
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.g6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          '중복 검사',
                          style:
                          FontStyles.Bn2_sb.copyWith(color: AppColors.g5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                  // onPressed: !controller.isDisplayError.value &&
                  //                       controller.isNicknameValid.value, ? null : () {
                  //   Get.toNamed(Routes.INFO);
                  // },
                  onPressed: () {
                    controller.setEnabled(0.54);
                    Get.toNamed(Routes.INFO);
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
        ),
      ),
    );
  }
}