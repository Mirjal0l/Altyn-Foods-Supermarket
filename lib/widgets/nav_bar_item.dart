import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework1/core/utils/app_colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.icon, required this.text, required this.isActive, required this.onPressed});

  final String icon;
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: IconButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero, 
            icon: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isActive? AppColors.light_green: AppColors.tab_color,
                BlendMode.srcIn
              ),
            ),
          ),
        ),

        // SizedBox(height: 2),

        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
              color: isActive? AppColors.light_green: AppColors.tab_color,
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
}
