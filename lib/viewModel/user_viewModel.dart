import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//GetxService : 화면을 떠나도 메모리가 유지됨, 로그인상태를 유지하는 상황에서 적합
//GetxService의 메모리를 지우는 방법 -> Get.reset();을 통해 메모리를 모두 삭제, 그러나 controller까지 모두 지우게 돼서 좋지않다
//GetxController : 화면을 떠나면 메모리를 자동으로 삭제함, 값이 유지되지 않음
//GetxController에서 영구적으로 데이터를 유지하는 방법, permanent 속성 추가
//-> Get.put(GetxConroller(), permanent: true);
//permanent로 GetxService를 간접적으로 사용하는 방법 추천
class UserViewModel extends GetxController {
  late Dio dio;

  TextEditingController nicknameController = TextEditingController();

  //Rx+자료형, .obs를 붙여야 반응형 상태관리 사용 가능
  Rx<bool> isEnabled = false.obs;
  Rx<double> getPercentProgress = 0.3.obs;
  Rx<bool> isNicknameValid = false.obs;
  Rx<bool> isDisplayError = false.obs;
  Rx<bool> isFocused = false.obs;

  //닉네임 필터링
  void checkNickname(String value) {
    RegExp regExp = RegExp(r'^[\w가-힣_-]{2,10}$');
    isNicknameValid.value = regExp.hasMatch(value);
  }

  //닉네임 중복 여부 확인
  Future<bool> isDuplicate(String value) async {
    try {
      final response = await dio.get('user 닉네임 받아올 경로');
      if (response.statusCode == 200) {
        return false;
      }
      return true;
    } catch (e) {
      return true;
    }
  }

  //오류 상태 저장
  void setDisplayError(bool display) {
    isDisplayError.value = display;
  }

  void setFocus(bool focused) {
    isFocused.value = focused;
  }

  //진행률 상태 저장
  void setEnabled(double nextProgress) {
    getPercentProgress(nextProgress);
  }

  void updateUserInfo(String nickname) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('nickname', nickname);
  }

  //gender, 이중일택
  RxBool genderSelect = false.obs;
  RxList<bool> genderList = [false, false].obs;

  void selectGender(int index) {
    genderSelect.value = true;
    for (int i = 0; i < genderList.length; i++) {
      if (i == index) {
        genderList[i] = true;
      } else {
        genderList[i] = false;
      }
    }
  }

  //생년월일
  var selectedDate = DateTime.now().obs;
  RxBool dateSelect = false.obs;

  //interest, 다중선택
  RxBool interestSelect = false.obs;
  RxList<bool> interestList = [false, false, false, false, false, false].obs;

  void selectInterest(int index) async {
    for (int i = 0; i < interestList.length; i++) {
      if (i == index) {
        interestList[i] = !interestList[i];
      }
    }

    if (interestList.contains(true)) {
      interestSelect.value = true;
    } else {
      interestSelect.value = false;
    }
  }

  //뉴스레터 frequency, 다중일택
  RxBool frequencySelect = false.obs;
  RxList<bool> frequencyList = [false, false, false, false].obs;

  void selectFrequency(int index) {
    frequencySelect.value = true;
    for (int i = 0; i < frequencyList.length; i++) {
      if (i == index) {
        frequencyList[i] = true;
      } else {
        frequencyList[i] = false;
      }
    }
  }

  void resetFrequency() {
    for (int i = 0; i < frequencyList.length; i++) {
      frequencyList[i] = false;
    }
  }
}
