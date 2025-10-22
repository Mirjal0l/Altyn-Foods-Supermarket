import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/auth/signin.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets//onboarding_item.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.54 * MediaQuery
                    .of(context)
                    .size
                    .height,
                width: double.infinity,
                child: Onboarding(images: [
                  "assets/images/img1.jpg",
                  "assets/images/img2.jpg",
                  "assets/images/img3.jpg"
                ]),
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing",
                  style: TextStyle(
                    color: AppColors.light_black,
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                    height: 1.2,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                  style: TextStyle(
                    color: AppColors.dark_gray,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.6,
                    letterSpacing: 0,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Button(
                      text: AppLocalizations.of(context)?.translate("skip") ?? "Пропустить",
                      color: AppColors.light_green,
                      onPressed: () {
                        context.go(Routes.registration);
                      },
                      width: 0.45 * MediaQuery.of(context).size.width,
                      withIcon: false,
                    ),
                    Button(
                      text: AppLocalizations.of(context)?.translate("start") ?? "Начать",
                      color: AppColors.orange,
                      onPressed: () {
                        context.go(Routes.signin);
                      },
                      withIcon: false,
                      width: 0.45 * MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)?.translate("account") ?? "У вас уже есть аккаунт?",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: 0,
                      color: AppColors.dark_gray,
                    ),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)?.translate("login") ?? " Войти",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          letterSpacing: 0,
                          fontSize: 16,
                          color: AppColors.orange,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Routes.signin);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
