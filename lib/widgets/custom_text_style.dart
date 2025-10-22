import 'package:flutter/material.dart';
import 'package:homework1/core/utils/app_colors.dart';

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle({super.key, required this.text, this.isBold = true, this.isCenter = false, this.fontSize = 20});

  final String text;
  final bool isBold;
  final bool isCenter;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
    final boldText = Container(
      child: Text(
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
        text,
        style: TextStyle(
          color: AppColors.light_black,
          fontFamily: 'Inter',
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,

        ),
      ),
    );

    final grayedText = Container(
      child: Text(
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
        text,
        style: TextStyle(
          color: AppColors.dark_gray,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.2,
          letterSpacing: 0,
        ),
      ),
    );

    return Container(
      child: isBold ? boldText : grayedText,
    );
  }
}
