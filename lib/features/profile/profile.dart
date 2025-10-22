import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/auth/signin.dart';
import 'package:homework1/features/profile/account_changing.dart';
import 'package:homework1/features/profile/details/language.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_text_style.dart';
import 'package:homework1/widgets/profile_gesture_detector.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: AppColors.avatar_color,
                      ),
                      child: Text(
                        AppLocalizations.of(context)?.translate("i") ?? "И",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          letterSpacing: 0,
                          color: Color(0xFF1D1D21),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: AppLocalizations.of(context)?.translate("good_afternoon") ?? "Добрый день,",
                              style: TextStyle(
                                color: AppColors.light_black,
                                fontFamily: 'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                letterSpacing: 0,
                              ),
                              children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)?.translate("ivan") ?? "Иван Иванов!",
                                  style: TextStyle(
                                    color: AppColors.light_black,
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "+ 7 965 568 15 98",
                            style: TextStyle(
                              color: AppColors.dark_gray,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 24 / 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              CustomTextStyle(text: AppLocalizations.of(context)?.translate("profile") ?? "Профиль", isBold: true),

              SizedBox(height: 4,),

              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("my_address") ?? "Мои адреса",
                isBold: false,
                onPressed: () {
                  context.push(Routes.my_address);
                },
              ),

              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("language") ?? "Язык",
                isBold: false,
                onPressed: () {
                  context.push(Routes.language);
                },
              ),

              SizedBox(height: 4,),

              CustomTextStyle(text: AppLocalizations.of(context)?.translate("info") ?? "Информация", isBold: true),

              SizedBox(height: 4,),

              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("contact_us") ?? "Свяжитесь с нами",
                isBold: false,
                onPressed: () {
                  context.push(Routes.contact_us);
                },
              ),
              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("public_offer") ?? "Публичная оферта",
                isBold: false,
                onPressed: () {
                  context.push(Routes.public_offer);
                },
              ),
              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("privacy_policy") ?? "Политика конфиденциальности",
                isBold: false,
                onPressed: () {
                  context.push(Routes.privacy_policy);
                },
              ),
              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("news") ?? "Новости",
                isBold: false,
                onPressed: () {
                  context.push(Routes.news);
                },
              ),
              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("delivery") ?? "Доставка",
                isBold: false,
                onPressed: () {
                  context.push(Routes.delivery);
                },
              ),
              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("about_us") ?? "О нас",
                isBold: false,
                onPressed: () {
                  context.push(Routes.about_us);
                },
              ),
              ProfileGestureDetector(
                text: AppLocalizations.of(context)?.translate("faq") ?? "FAQ",
                isBold: false,
                onPressed: () {
                  context.push(Routes.faq);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Button(
            text: AppLocalizations.of(context)?.translate("change_account") ?? "Сменить аккаунт",
            color: AppColors.orange,
            withIcon: false,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => const AccountChanging()));
            },
            width: double.infinity,
          ),
        ),
      )
    );
  }
}
