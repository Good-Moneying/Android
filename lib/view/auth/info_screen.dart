import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/viewModel/user_viewModel.dart';

import '../../design/style/FontStyles.dart';
import '../../design/widgets/progress_bar.dart';
import '../../routes/get_pages.dart';

class InfoScreen extends GetView<UserViewModel> {
  final formatBirth = MaskTextInputFormatter(mask: '####-##-##');

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
      resizeToAvoidBottomInset: false,
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
                      style:
                          FontStyles.Title2_b.copyWith(color: AppColors.v6),
                    ),
                    TextSpan(
                      text: '님의',
                      style: FontStyles.Title2_m.copyWith(
                          color: AppColors.black),
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
                height: Get.height * 0.03,
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
                height: Get.height * 0.03,
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
                      () => TextFormField(
                        onTapOutside: (event) {
                          if (controller.birthController.value.text.length ==
                              10) {
                            controller.dateSelect.value = true;
                          } else {
                            controller.dateSelect.value = false;
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: controller.birthController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.datetime,
                        onChanged: (text) {
                          print("text field: $text");
                          controller.dateValid.value =  isValidDate(text.replaceAll('-', ''));
                        },
                        style:
                            FontStyles.Ln1_m.copyWith(color: AppColors.black),
                        maxLength: 10,
                        inputFormatters: [formatBirth],
                        onFieldSubmitted: (String value) {
                          if (value.length == 10) {
                            controller.dateSelect.value = true;
                          } else {
                            controller.dateSelect.value = false;
                          }
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          errorText: controller.dateValid.value ? null : '유효하지 않은 생년월일 입니다.',
                          errorStyle: FontStyles.Caption2_m.copyWith(
                              color: Colors.red),
                          hintText: '생년월일 8자리를 입력해주세요.',
                          hintStyle:
                              FontStyles.Ln1_m.copyWith(color: AppColors.g3),
                          //border 색깔
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.g2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: const Color(0xFFFA5862),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: const Color(0xFFFA5862),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.v5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Obx(
                () => SizedBox(
                  child: ElevatedButton(
                    onPressed: controller.genderSelect.value == false ||
                            controller.dateValid.value == false
                        ? null
                        : () {
                            Get.toNamed(Routes.INTEREST);
                            controller.setEnabled(0.77);
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppColors.v6,
                    ),
                    child: Text(
                      '다음',
                      style: FontStyles.Bn1_b.copyWith(
                          color: controller.genderSelect.value == false ||
                                  controller.dateSelect.value == false
                              ? const Color(0xFFAAAAB9)
                              : AppColors.white),
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

bool isValidDate(String input) {
  try {
    // 생년월일 파싱 시도
    DateTime? parsedDate = DateTime.tryParse(input.substring(0, 4) + "-" + input.substring(4, 6) + "-" + input.substring(6, 8));

    //false -> 유효하지 않음
    //true -> 유효함
    // 파싱이 실패하면 유효하지 않은 날짜로 판단
    if (parsedDate == null) {
      return false;
    }

    // 생년월일이 유효한지 확인
    return parsedDate.year.toString() == input.substring(0, 4) &&
        parsedDate.month.toString().padLeft(2, '0') == input.substring(4, 6) &&
        parsedDate.day.toString().padLeft(2, '0') == input.substring(6, 8);
  } catch (e) {
    // 날짜 파싱 중 오류가 발생한 경우 유효하지 않은 날짜로 처리
    return false;
  }
}
