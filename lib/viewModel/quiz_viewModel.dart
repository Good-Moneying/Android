import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizViewModel extends GetxController {
  Rx<bool> init = true.obs;
  Rx<bool> firstQ = false.obs;
  Rx<bool> secondQ = false.obs;
  Rx<bool> thirdQ = false.obs;
  Rx<bool> fourthQ = false.obs;

  Rx<String> wrongQ = 'init'.obs;
  Rx<String> wrongDetail = 'init'.obs;

  Rx<bool> init2 = true.obs;
  Rx<bool> firstQ2 = false.obs;
  Rx<bool> secondQ2 = false.obs;
  Rx<bool> thirdQ2 = false.obs;
  Rx<bool> fourthQ2 = false.obs;

  Rx<String> wrongQ2 = 'init'.obs;
  Rx<String> wrongDetail2 = 'init'.obs;

  Rx<bool> init3 = true.obs;
  Rx<bool> firstQ3 = false.obs;
  Rx<bool> secondQ3 = false.obs;
  Rx<bool> thirdQ3 = false.obs;
  Rx<bool> fourthQ3 = false.obs;

  Rx<String> wrongQ3 = 'init'.obs;
  Rx<String> wrongDetail3 = 'init'.obs;

  Rx<bool> init4 = true.obs;
  Rx<bool> firstQ4 = false.obs;
  Rx<bool> secondQ4 = false.obs;
  Rx<bool> thirdQ4 = false.obs;
  Rx<bool> fourthQ4 = false.obs;

  Rx<String> wrongQ4 = 'init'.obs;
  Rx<String> wrongDetail4 = 'init'.obs;


}
