import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                //진행률 바
                MyProgressBar(percent: controller.getPercentProgress.value),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '1/4',
                      style:
                          FontStyles.Caption1_r.copyWith(color: AppColors.g4),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '두둑',
                        style:
                            FontStyles.Title2_b.copyWith(color: AppColors.v5),
                      ),
                      TextSpan(
                        text: '에서 사용할',
                        style: FontStyles.Title2_m.copyWith(
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '닉네임',
                        style: FontStyles.Title2_b.copyWith(
                            color: AppColors.black),
                      ),
                      TextSpan(
                        text: '을 알려주세요',
                        style: FontStyles.Title2_m.copyWith(
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  '닉네임은 마이페이지에서 언제든 바꿀 수 있어요!',
                  style: FontStyles.Label2_sb.copyWith(color: AppColors.g4),
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
                          () => TextFormField(
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            controller: controller.nicknameController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '2~10자 이내',
                              hintStyle: FontStyles.Label2_r.copyWith(
                                  color: Color(0xFF888888)),
                              errorText: controller.isDisplayError.value
                                  ? "* 닉네임을 사용할 수 없습니다"
                                  : "* 닉네임을 사용할 수 있습니다",
                              errorStyle: controller.isDisplayError.value
                                  ? TextStyle(
                                      color: Colors.red,
                                      fontSize: 11,
                                    )
                                  : TextStyle(
                                      color: Colors.blue,
                                      fontSize: 11,
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
                    SizedBox(
                      height: Get.height * 0.58,
                    ),
                    ElevatedButton(
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
                        backgroundColor: AppColors.v6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        '중복 검사',
                        style: FontStyles.Label2_sb.copyWith(
                            color: AppColors.white),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                  ],
                ),
                ElevatedButton(
                  // onPressed: !controller.isDisplayError.value &&
                  //                       controller.isNicknameValid.value, ? null : () {
                  //   Get.toNamed(Routes.INFO);
                  // },
                  onPressed: () {
                    Get.toNamed(Routes.INFO);
                    controller.setEnabled(0.54);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppColors.v5,
                  ),
                  child: Text(
                    '다음',
                    style: FontStyles.Bn1.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
