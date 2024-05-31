import 'package:flutter/material.dart';
import 'package:meetup/viewModel/quiz_viewModel.dart';
import 'package:get/get.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuizViewModel());
  }
}