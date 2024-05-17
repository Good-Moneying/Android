import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../style/ColorStyles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


_getBackAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: SvgPicture.asset(
        'assets/icons/back_left.svg',
        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
    ),
  );
}