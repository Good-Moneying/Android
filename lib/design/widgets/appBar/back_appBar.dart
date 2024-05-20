import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';


class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color iconColor;
  final Widget? title;

  const BackAppBar({
    super.key,
    required this.iconColor,
    required this.title,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          'assets/icons/back_left.svg',
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
      centerTitle: true,
      title: title,
    );
  }

}
