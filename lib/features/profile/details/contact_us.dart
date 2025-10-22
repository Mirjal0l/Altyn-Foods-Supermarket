import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_text_style.dart';
import 'package:homework1/widgets/profile_gesture_detector.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("contact_us") ?? "Контакты",
          hasActions: false
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(height: 16,),

                CustomTextStyle(
                  text: AppLocalizations.of(context)?.translate("working_time") ?? "Принимаем звонки с 7:00 до 22:00 и отвечаем на сообщения с 9:00 до 21:00",
                  isBold: false,
                  isCenter: true,
                ),

                SizedBox(height: 16,),

                ProfileGestureDetector(text: AppLocalizations.of(context)?.translate("whatsup") ?? "Начать беседу в WhatsApp", isBold: false, onPressed: () {}),
                ProfileGestureDetector(text: "+7 965 568 15 98", isBold: false, onPressed: (){}),
                ProfileGestureDetector(text: "+7 965 568 15 98", isBold: false, onPressed: (){}),
                ProfileGestureDetector(text: AppLocalizations.of(context)?.translate("email") ?? "Напишите нам на почту", isBold: false, onPressed: () {}),
              ],
            ),
        ),
      )
    );
  }
}
