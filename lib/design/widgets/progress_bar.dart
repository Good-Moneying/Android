import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:meetup/viewModel/user_viewModel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../style/ColorStyles.dart';

class MyProgressBar extends GetView<UserViewModel> {
  final double percent;
  final Color backgroundColor;
  final Color progressColor;

  const MyProgressBar({
    super.key,
    required this.percent,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      animation: true,
      animationDuration: 1000,
      animateFromLastPercent: true,
      percent: percent,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
      lineHeight: 10,
      barRadius: Radius.circular(10),
    );
  }
}
