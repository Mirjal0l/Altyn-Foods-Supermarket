import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework1/widgets/custom_text_style.dart';

class ProfileGestureDetector extends StatelessWidget {
  const ProfileGestureDetector({super.key, required this.text, required this.isBold, required this.onPressed});
  final String text;
  final bool isBold;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextStyle(text: text, isBold: isBold),
            SvgPicture.asset(
              "assets/icons/arrowright.svg",
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
