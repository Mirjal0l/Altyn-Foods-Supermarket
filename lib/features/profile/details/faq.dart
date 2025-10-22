import 'package:flutter/material.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_text_style.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("faq") ?? "faq",
          hasActions: false
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("how_to_register") ?? "how to register", isBold: true, isCenter: false,),
              SizedBox(height: 20,),
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("faq1") ?? "faq1", isBold: false, isCenter: false,),
              SizedBox(height: 20,),
              
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("how_to_place_an_order") ?? "how to place an order", isBold: true, isCenter: false,),
              SizedBox(height: 20,),
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("faq2") ?? "faq2", isBold: false, isCenter: false,),
              SizedBox(height: 20,),
              
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("how_to_pay") ?? "how to pay", isBold: true, isCenter: false,),
              SizedBox(height: 20,),
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("faq3") ?? "faq3", isBold: false, isCenter: false,),
              SizedBox(height: 20,),
              
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("when_order_delivered") ?? "when order will be delivered", isBold: true, isCenter: false,),
              SizedBox(height: 20,),
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("faq4") ?? "faq4", isBold: false, isCenter: false,),
              SizedBox(height: 20,),
              
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("how_much_cost") ?? "how much does it costs", isBold: true, isCenter: false,),
              SizedBox(height: 20,),
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("faq5") ?? "faq5", isBold: false, isCenter: false,),
              SizedBox(height: 20),
              
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("refund") ?? "refund", isBold: true, isCenter: false,),
              SizedBox(height: 20,),
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("faq6") ?? "faq6", isBold: false, isCenter: false,),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
