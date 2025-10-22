import 'package:flutter/material.dart';
import 'package:homework1/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double width;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.width,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.border_color,
          width: 1
        )
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.dark_gray,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8)
        ),
      ),
    );
  }
}
