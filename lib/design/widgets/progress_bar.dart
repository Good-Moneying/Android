import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../style/ColorStyles.dart';

class MyProgressBar extends GetView<UserViewModel> {
  final double percent;

  const MyProgressBar({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      animation: true,
      animationDuration: 1000,
      animateFromLastPercent: true,
      percent: percent,
      backgroundColor: AppColors.g1,
      progressColor: AppColors.v2,
      lineHeight: 10,
      barRadius: Radius.circular(10),
    );
  }
}
