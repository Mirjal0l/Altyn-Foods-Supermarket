import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework1/core/utils/app_colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.withIcon,
    this.iconAdress = null,
    required this.onPressed,
    required this.width,
    this.height = 51,
  });

  final String text;
  final Color color;
  final bool withIcon;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String? iconAdress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: withIcon ?
        ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: AppColors.orange, width: 1),
            ),
        ) : ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: color, width: 1),
          ),
        ),
        child: withIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(iconAdress!, width: 20, height: 20),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.orange,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  letterSpacing: -0.88,
                ),
              ),
      ),
    );
  }
}
