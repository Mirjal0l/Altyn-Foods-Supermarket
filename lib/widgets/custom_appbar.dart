import 'package:flutter/material.dart';
import 'package:homework1/core/utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final bool hasLeading;
  final String title;
  final bool hasActions;
  final String? actionTitle;
  final VoidCallback? onActionClicked;
  final double height;
  const CustomAppbar({
    super.key,
    required this.hasLeading,
    required this.title,
    required this.hasActions,
    this.actionTitle,
    this.onActionClicked,
    this.height = kToolbarHeight
  });

  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      leading: hasLeading ? IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back,
            size: 24,
            color: AppColors.light_black,
          )
      ) : null,

      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.light_black
        ),
      ),
      centerTitle: true,

      actions: hasActions ? [
        TextButton(
          onPressed: onActionClicked,
          child: Text(
            actionTitle ?? '', // Handle null case
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.dark_gray
            ),
          ),
        )
      ] : null,
    );
  }
}
