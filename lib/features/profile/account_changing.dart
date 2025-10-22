import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/widgets/custom_empty_page.dart';

import '../../core/l10n/app_localization.dart';
import '../../core/utils/app_colors.dart';
import '../../router/name_routes.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_text_style.dart';
import '../../widgets/profile_gesture_detector.dart';

class AccountChanging extends StatelessWidget {
  const AccountChanging({super.key});

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
              SizedBox(height: 20),

              Text(
                AppLocalizations.of(context)?.translate("welcome") ??
                    "Добро пожаловать",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                  color: AppColors.light_black,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              Text(
                AppLocalizations.of(context)?.translate("welcome_sub_text") ??
                    "welcome sub text",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                  color: AppColors.tab_color,
                ),
              ),

              SizedBox(height: 20),

              Button(
                text:
                    AppLocalizations.of(
                      context,
                    )?.translate("login_to_profile") ??
                    "log in to profile",
                color: AppColors.orange,
                withIcon: false,
                onPressed: () {
                  context.push(Routes.profile);
                },
                width: double.infinity,
              ),

              SizedBox(height: 20),

              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("language") ??
                    "Язык",
                isBold: false,
                onPressed: () {
                  context.push(Routes.language);
                },
              ),

              SizedBox(height: 4),

              CustomTextStyle(
                text:
                    AppLocalizations.of(context)?.translate("info") ??
                    "Информация",
                isBold: true,
              ),

              SizedBox(height: 4),

              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("contact_us") ??
                    "Свяжитесь с нами",
                isBold: false,
                onPressed: () {
                  context.push(Routes.contact_us);
                },
              ),
              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("public_offer") ??
                    "Публичная оферта",
                isBold: false,
                onPressed: () {
                  context.push(Routes.public_offer);
                },
              ),
              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("privacy_policy") ??
                    "Политика конфиденциальности",
                isBold: false,
                onPressed: () {
                  context.push(Routes.privacy_policy);
                },
              ),
              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("news") ??
                    "Новости",
                isBold: false,
                onPressed: () {
                  context.push(Routes.news);
                },
              ),
              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("delivery") ??
                    "Доставка",
                isBold: false,
                onPressed: () {
                  context.push(Routes.delivery);
                },
              ),
              ProfileGestureDetector(
                text:
                    AppLocalizations.of(context)?.translate("about_us") ??
                    "О нас",
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
      )
    );
  }
}
