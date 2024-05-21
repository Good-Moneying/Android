import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';


class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressed;

  const QuizAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          'assets/icons/back_left.svg',
          colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
    );
  }

}
