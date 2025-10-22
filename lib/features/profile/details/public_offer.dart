import 'package:flutter/material.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_text_style.dart';

class PublicOffer extends StatelessWidget {
  const PublicOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("public_offer") ?? "public offer",
          hasActions: false
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),

              CustomTextStyle(text: AppLocalizations.of(context)?.translate("general_provisions") ?? "1. Общие положения", isBold: true, isCenter: false,),
          
              SizedBox(height: 16,),
          
              CustomTextStyle(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                isBold: false,
                isCenter: false,
              ),
          
              SizedBox(height: 20,),
          
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("subject_of_an_argument") ?? "2. Предмет договора", isBold: true, isCenter: false,),
          
              SizedBox(height: 16,),
          
              CustomTextStyle(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                isBold: false,
              ),
          
              SizedBox(height: 20,),
          
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("placing_an_order") ?? "3. Оформление заказа", isBold: true, isCenter: false),
          
              SizedBox(height: 16,),
          
              CustomTextStyle(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                isBold: false,
              ),
          
              SizedBox(height: 20,),
          
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("acceptance_and_return_of_goods") ?? "4. Прием и возврат товара", isBold: true, isCenter: false),
          
              SizedBox(height: 16,),
          
              CustomTextStyle(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                isBold: false,
              ),
          
              SizedBox(height: 20,),
          
              CustomTextStyle(text: AppLocalizations.of(context)?.translate("delivery_terms") ?? "5. Условия доставки", isBold: true, isCenter: false),
          
              SizedBox(height: 16,),
          
              CustomTextStyle(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                isBold: false,
              ),
          
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
