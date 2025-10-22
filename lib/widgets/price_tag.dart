import 'package:flutter/material.dart';
import 'package:homework1/core/utils/app_colors.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        decoration: BoxDecoration(
          color: AppColors.unpressable_orange,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "Inter",
            color: AppColors.orange
          ),
        ),
      ),
    );
  }
}
