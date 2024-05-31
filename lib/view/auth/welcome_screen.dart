import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:meetup/view/bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';
import '../../service/auth_service.dart';
import '../../viewModel/nickname_viewModel.dart';
import '../../viewModel/user_viewModel.dart';

class WelcomeScreen extends GetView<UserViewModel> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9.0, bottom: 24.0),
                  child: Text(
                    '준비완료!',
                    style: FontStyles.Title1_b.copyWith(color: AppColors.v6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: Text(
                    '이제 경제 금융 지식',
                    style:
                        FontStyles.Title2_sb.copyWith(color: AppColors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9.0, bottom: 38),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/logo_newthing.svg'),
                      Text(
                        '과 함께 시작하세요!',
                        style: FontStyles.Title2_sb.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/gurumi_welcome.png'),
                  ],
                ),
                Spacer(),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () async {
                      //저장된 데이터 가져오기
                      final prefs = await SharedPreferences.getInstance();
                      String email = prefs.getString('email')!;
                      String refreshToken = prefs.getString('refreshToken')!;
                      String accessToken = prefs.getString('accessToken')!;
                      String provider = prefs.getString('provider')!;

                      //입력한 데이터 가져오기
                      controller.setGender(controller.genderList.value);
                      controller.setCategory(controller.interestList.value);
                      controller.setFrequency(controller.frequencyList.value);
                      String formatBirth = controller.birthController.value.text
                          .replaceAll('-', '');

                      //넘겨줄 데이터 구성
                      final formData = <String, dynamic> {
                        "email": email,
                        "nickname": controller.nicknameController.value.text,
                        "refreshToken": refreshToken,
                        "gender": controller.userGender.value,
                        "birthDay": formatBirth,
                        "provider": provider,
                        "category": 'finance',
                        //controller.userCategory.value,
                        "goal": controller.userGoal.value,
                      };

                      NicknameViewModel nicknameViewModel = Get.find<NicknameViewModel>();
                      nicknameViewModel.nickname = controller.nicknameController.value.text;

                      //서버에 데이터 전송
                      await onboarding(formData);

                      Get.offAll(BottomNavigationView());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppColors.v6,
                    ),
                    child: Text(
                      '시작하기',
                      style: FontStyles.Bn1_b.copyWith(color: AppColors.white),
                    ),
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
