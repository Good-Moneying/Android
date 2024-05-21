import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyViewModel extends GetxController {
  Rx<bool> isFollow = false.obs;
  Rx<bool> isLike = false.obs;

  Rx<bool> isFollow2 = false.obs;
  Rx<bool> isLike2 = false.obs;

  Rx<bool> isFollow3 = false.obs;
  Rx<bool> isLike3 = false.obs;

  Rx<bool> allComment = true.obs;
  Rx<bool> agreeComment = false.obs;
  Rx<bool> disagreeComment = false.obs;
}
