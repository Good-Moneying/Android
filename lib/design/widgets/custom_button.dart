import 'package:flutter/material.dart';
import 'package:meetup/design/style/FontStyles.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final TextStyle textStyle;
  final String label;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textStyle,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
