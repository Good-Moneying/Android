import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizViewModel extends GetxController {
  Rx<bool> init = true.obs;
  Rx<bool> firstQ = false.obs;
  Rx<bool> secondQ = false.obs;
  Rx<bool> thirdQ = false.obs;
  Rx<bool> fourthQ = false.obs;

}
