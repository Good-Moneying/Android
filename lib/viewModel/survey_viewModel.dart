import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyViewModel extends GetxController with GetSingleTickerProviderStateMixin  {
  Rx<bool> isFollow = false.obs;
  Rx<bool> isLike = false.obs;

  Rx<bool> isFollow2 = false.obs;
  Rx<bool> isLike2 = false.obs;

  Rx<bool> isFollow3 = false.obs;
  Rx<bool> isLike3 = false.obs;

  Rx<bool> allComment = true.obs;
  Rx<bool> agreeComment = false.obs;
  Rx<bool> disagreeComment = false.obs;


  //애니메이션
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
  }

  void startAnimation() {
    animationController.forward();
  }
}
