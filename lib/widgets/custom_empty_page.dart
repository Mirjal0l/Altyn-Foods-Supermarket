import 'package:flutter/material.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/button.dart';

class CustomEmptyPage extends StatelessWidget {
  final bool hasImage;
  final String? image;
  final double? imageWidth;
  final double? imageHeight;
  final String boldText;
  final String subText;
  final String? buttonText;
  final VoidCallback? onButtonClicked;
  const CustomEmptyPage({
    super.key,
    required this.hasImage,
    this.image,
    this.imageWidth,
    this.imageHeight,
    required this.boldText,
    required this.subText,
    this.buttonText,
    this.onButtonClicked
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasImage && image != null) ...[
                Image.asset(image!, width: imageWidth, height: imageHeight, fit: BoxFit.contain, alignment: Alignment.center),
              ] ,

              SizedBox(height: 30),

              Text(
                boldText ?? " ",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  color: AppColors.light_black
                ),
              ),

              SizedBox(height: 16),

              Text(
                subText ?? "",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                  color: AppColors.dark_gray
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              if (buttonText != null && onButtonClicked != null) ...[
                Button(
                    text: buttonText ?? "",
                    color: AppColors.orange,
                    withIcon: false,
                    onPressed: (){
                      if (onButtonClicked != null) onButtonClicked!();
                    },
                    width: double.infinity
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
