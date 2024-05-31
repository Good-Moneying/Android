import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meetup/design/style/ColorStyles.dart';
import 'package:meetup/design/style/FontStyles.dart';

class LoginButton extends StatelessWidget {
  final Color backgroundColor;
  final String icon;
  final String label;
  final Function() onTap;

  const LoginButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 31,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 65,
              ),
              Text(
                label,
                style: FontStyles.Label2_m.copyWith(
                  color: AppColors.black.withOpacity(0.85),
                ),
              ),
              SizedBox(
                width: 75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
