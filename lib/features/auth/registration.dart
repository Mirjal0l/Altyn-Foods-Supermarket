import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/auth/signin.dart';
import 'package:homework1/features/auth/webview.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/button_and_textfield.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop){
            if (!didPop) {
              context.go(Routes.welcome);
            }  
          },
          
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),

                Container(
                  width: 0.54 * MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/icons/company.png",
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 80),

                Container(
                  width: double.infinity,
                  child: Text(
                    AppLocalizations.of(context)?.translate("register") ?? "Зарегистрироваться",
                    style: TextStyle(
                      color: AppColors.orange,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      letterSpacing: 0,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 16),

                ButtonAndTextField(isRegisteredBefore: false),

                SizedBox(height: 16),

                Container(
                  child: Text(
                    AppLocalizations.of(context)?.translate("or") ?? "или",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 1.4,
                      letterSpacing: 0,
                      color: AppColors.dark_gray,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                Button(
                  text: AppLocalizations.of(context)?.translate("google") ?? "Продолжить с Google",
                  withIcon: true,
                  color: AppColors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebView(url: "https://www.google.com"))
                    );
                  },
                  width: double.infinity,
                  iconAdress: 'assets/icons/google.svg',
                ),

                SizedBox(height: 16),

                Button(
                  text: AppLocalizations.of(context)?.translate("apple") ?? "Продолжить с Apple",
                  withIcon: true,
                  color: AppColors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebView(url: "https://www.apple.com"))
                    );
                  },
                  width: double.infinity,
                  iconAdress: 'assets/icons/apple.svg',
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AppLocalizations.of(context)?.translate("account") ?? "У вас уже есть аккаунт?",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 20 / 16,
                          letterSpacing: -0.5,
                          color: AppColors.dark_gray,
                        ),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)?.translate("login") ?? " Войти",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 20 / 16,
                              letterSpacing: -0.5,
                              color: AppColors.orange,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: AppColors.orange,
                              decorationThickness: 1,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Sign_In()),
                                    ModalRoute.withName('/homepage'),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
