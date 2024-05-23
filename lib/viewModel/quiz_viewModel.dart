import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizViewModel extends GetxController {
  Rx<bool> init = true.obs;
  Rx<bool> firstQ = false.obs;
  Rx<bool> secondQ = false.obs;
  Rx<bool> thirdQ = false.obs;
  Rx<bool> fourthQ = false.obs;

  RxBool q1elect = false.obs;
  RxList<bool> q1List = [false, false, false, false].obs;
  RxString CorrectQ = 'unknown'.obs;
  RxString CorrectDetail = 'unknown'.obs;

  void selectQ(int index) {
    q1elect.value = true;
    for (int i = 0; i < q1List.length; i++) {
      if (i == index) {
        q1List[i] = true;
      } else {
        q1List[i] = false;
      }
    }
  }

  Rx<String> wrongQ = 'init'.obs;
  Rx<String> wrongDetail = 'init'.obs;

  Rx<bool> init2 = true.obs;
  Rx<bool> firstQ2 = false.obs;
  Rx<bool> secondQ2 = false.obs;
  Rx<bool> thirdQ2 = false.obs;
  Rx<bool> fourthQ2 = false.obs;

  RxBool q2elect = false.obs;
  RxList<bool> q2List = [false, false, false, false].obs;
  RxString CorrectQ2 = 'unknown'.obs;
  RxString CorrectDetail2 = 'unknown'.obs;

  void selectQ2(int index) {
    q2elect.value = true;
    for (int i = 0; i < q2List.length; i++) {
      if (i == index) {
        q2List[i] = true;
      } else {
        q2List[i] = false;
      }
    }
  }

  Rx<String> wrongQ2 = 'init'.obs;
  Rx<String> wrongDetail2 = 'init'.obs;

  Rx<bool> init3 = true.obs;
  Rx<bool> firstQ3 = false.obs;
  Rx<bool> secondQ3 = false.obs;
  Rx<bool> thirdQ3 = false.obs;
  Rx<bool> fourthQ3 = false.obs;

  RxBool q3elect = false.obs;
  RxList<bool> q3List = [false, false, false, false].obs;
  RxString CorrectQ3 = 'unknown'.obs;
  RxString CorrectDetail3 = 'unknown'.obs;

  void selectQ3(int index) {
    q3elect.value = true;
    for (int i = 0; i < q3List.length; i++) {
      if (i == index) {
        q3List[i] = true;
      } else {
        q3List[i] = false;
      }
    }
  }

  Rx<String> wrongQ3 = 'init'.obs;
  Rx<String> wrongDetail3 = 'init'.obs;

  Rx<bool> init4 = true.obs;
  Rx<bool> firstQ4 = false.obs;
  Rx<bool> secondQ4 = false.obs;
  Rx<bool> thirdQ4 = false.obs;
  Rx<bool> fourthQ4 = false.obs;

  RxBool q4elect = false.obs;
  RxList<bool> q4List = [false, false, false, false].obs;
  RxString CorrectQ4 = 'unknown'.obs;
  RxString CorrectDetail4 = 'unknown'.obs;

  void selectQ4(int index) {
    q4elect.value = true;
    for (int i = 0; i < q4List.length; i++) {
      if (i == index) {
        q4List[i] = true;
      } else {
        q4List[i] = false;
      }
    }
  }

  Rx<String> wrongQ4 = 'init'.obs;
  Rx<String> wrongDetail4 = 'init'.obs;

  Rx<int> quizResult = 0.obs;

}
