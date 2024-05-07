import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetup/view/bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';
import '../../service/auth_service.dart';
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
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Text(
                  '경제 금융 지식',
                  style: FontStyles.Title2_sb.copyWith(color: AppColors.black),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '두둑',
                        style:
                            FontStyles.Title1_b.copyWith(color: AppColors.v5),
                      ),
                      TextSpan(
                        text: '과 함께 시작하세요!',
                        style: FontStyles.Title2_sb.copyWith(
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () async {
                      //저장된 데이터 가져오기
                      final prefs = await SharedPreferences.getInstance();
                      String? email = prefs.getString('email');
                      String? refreshToken = prefs.getString('refreshToken');
                      String? provider = prefs.getString('provider');

                      //입력한 데이터 가져오기
                      controller.setGender(controller.genderList.value);
                      controller.setCategory(controller.interestList.value);
                      controller.setFrequency(controller.frequencyList.value);
                      final formatBirth = DateFormat('yyyy-MM-dd').format(controller.selectedDate.value);

                      print(formatBirth);
                      //넘겨줄 데이터 구성
                      final formData = <String, dynamic> {
                        "email": email,
                        "nickname": controller.nicknameController.value.text,
                        "refreshToken": refreshToken,
                        "gender": controller.userGender.value,
                        "birthDay": formatBirth,
                        "provider": provider,
                        "category": controller.userCategory.value,
                        "goal": controller.userGoal.value,
                      };


                      //출력테스트
                      //print(formData.fields);
                      //서버에 데이터 전송
                      await onboarding(formData);

                      Get.offAll(BottomNavigationView());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppColors.v5,
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
