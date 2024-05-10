import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';
import 'package:meetup/design/widgets/progress_bar.dart';
import 'package:meetup/routes/get_pages.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meetup/service/auth_service.dart';

class NicknameScreen extends GetView<UserViewModel> {
  const NicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserViewModel());

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
          padding: EdgeInsets.fromLTRB(18, 10, 18, 18),
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
                      text: '두둑',
                      style: FontStyles.Title2_b.copyWith(color: AppColors.v6),
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
              SizedBox(
                height: Get.height * 0.1,
                child: Row(
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
                          () => SizedBox(
                            //오류&helper 텍스트로 인한 크기 조절
                            height: controller.isDisplayError.value ||
                            controller.isNickDuplicate.value == false
                                ? Get.height * 0.14
                                : Get.height * 0.07,
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              controller: controller.nicknameController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.name,
                              onChanged: (text) {
                                controller.checkNickname(text);
                                print("text field: $text");
                              },
                              style: FontStyles.Ln1_m.copyWith(
                                  color: AppColors.black),
                              decoration: InputDecoration(
                                //contentPadding: const EdgeInsets.fromLTRB(10, -10, 10, 0),
                                suffix: GestureDetector(
                                  onTap: () {
                                    controller.nicknameController.clear();
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                  child: SvgPicture.asset(
                                    width: 17,
                                    height: 17,
                                    'assets/icons/text_clear.svg',
                                  ),
                                ),
                                // IconButton(
                                //         onPressed: () {
                                //           controller.nicknameController.clear();
                                //         },
                                //         icon: SvgPicture.asset(
                                //           width: 17,
                                //           height: 17,
                                //           'assets/icons/text_clear.svg',
                                //         ),
                                //       ),
                                hintText: '닉네임을 적어주세요',
                                hintStyle: FontStyles.Ln1_m.copyWith(
                                    color: AppColors.g3),
                                helperText:
                                    controller.isNickDuplicate.value == false
                                        ? "닉네임을 사용할 수 있습니다"
                                        : null,
                                helperStyle:
                                    controller.isNickDuplicate.value == false
                                        ? FontStyles.Caption2_m.copyWith(
                                            color: Colors.blue)
                                        : null,
                                errorText: controller.isDisplayError.value
                                    ? "닉네임을 사용할 수 없습니다"
                                    : null,
                                errorStyle: controller.isDisplayError.value
                                    ? FontStyles.Caption2_m.copyWith(
                                        color: Colors.red)
                                    : null,
                                //border 색깔
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: AppColors.g2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: AppColors.v5,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: controller.isDisplayError.value
                                        ? const Color(0xFFFA5862)
                                        : AppColors.g2,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: controller.isDisplayError.value
                                        ? const Color(0xFFFA5862)
                                        : AppColors.g2,
                                  ),
                                ),
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
                      height: Get.height * 0.07,
                      width: Get.width * 0.25,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.isDisplayError.value
                              ? null
                              : () async {
                                  //닉네임 중복값 업데이트
                                  controller.isNickDuplicate(await isDuplicate(
                                      controller
                                          .nicknameController.value.text));
                                },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: controller.isNickDuplicate.value
                                ? AppColors.g6
                                : AppColors.g2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: controller.isNickDuplicate.value
                              ? Text(
                                  '중복 검사',
                                  style: FontStyles.Bn2_sb.copyWith(
                                      color: controller.isDisplayError.value
                                          ? AppColors.g5
                                          : AppColors.white),
                                )
                              : Text(
                                  '검사 완료',
                                  style: FontStyles.Bn2_sb.copyWith(
                                      color: AppColors.g5),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isNickDuplicate.value
                      ? null
                      : () {
                          controller.setEnabled(0.54);
                          Get.toNamed(Routes.INFO);
                        },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppColors.v6,
                  ),
                  child: Text(
                    '다음',
                    style: FontStyles.Bn1_b.copyWith(
                        color: controller.isNickDuplicate.value
                            ? Color(0xFFAAAAB9)
                            : AppColors.white),
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
