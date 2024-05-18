import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';

import '../plus/stop_dialog.dart';


class DialogAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color iconColor;
  final Widget? title;

  const DialogAppBar({
    super.key,
    required this.iconColor,
    required this.title,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
              builder: ((context) {
                return StatefulBuilder(builder:
                    (BuildContext context,
                    StateSetter setState) {
                  return StopDialong();
                });
              }));
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
