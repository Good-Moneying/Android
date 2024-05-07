import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/view/bottomNavigationBar.dart';

import '../../design/style/ColorStyles.dart';
import '../../design/style/FontStyles.dart';
import '../../routes/get_pages.dart';
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
                    onPressed: () {
                      //임시적
                      print(controller.nicknameController.value.text);
                      print(controller.genderList.value);
                      print(controller.selectedDate.value);
                      print(controller.interestList.value);
                      print(controller.frequencyList.value);

                      //!! 출력결과 !!
                      // 내사랑사 -> 닉네임
                      // [false, true] -> 성별
                      // 2024-05-01 00:00:00.000 -> 생년월일
                      // [false, true, false, false, true, false] -> 관심사
                      // [true, false, false, false] -> 빈도수

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