import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetup/service/auth_service.dart';

class LoginButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String icon;
  final String label;
  final Function() onTap;

  const LoginButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 30,
                width: 30,
              ),
              SizedBox(width: 65,),
              Text(
                label,
                style: TextStyle(
                    //디자인 확정나면 수정
                    fontSize: 16,
                    color: textColor),
              ),
              SizedBox(width: 75,),

            ],
          ),
        ),
      ),
    );
  }
}
