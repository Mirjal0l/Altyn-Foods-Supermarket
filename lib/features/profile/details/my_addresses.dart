import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_text_field.dart';
import 'package:homework1/widgets/custom_text_style.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({super.key});

  @override
  State<MyAddresses> createState() => _MyAddressesState();

}

class _MyAddressesState extends State<MyAddresses> {
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _apartment = TextEditingController();
  final _entrance = TextEditingController();
  final _floor = TextEditingController();
  final _comments = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("my_addresses") ?? "Мои адреса",
          hasActions: false
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: AppColors.unpressable_orange
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset('assets/icons/home.svg', width: 20, height: 20, colorFilter: ColorFilter.mode(AppColors.tab_color, BlendMode.srcIn)),
          
                        ),
                      ),
          
                      SizedBox(width: 8),
          
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextStyle(text: "Пушкина, 16", isBold: true),
                          CustomTextStyle(text: "Алматы, 1 кв", isBold: false,)
                        ],
                      ),
                    ],
                  ),
                  
                  GestureDetector(
                    onTap: (){
          
                    },
                    child: Container(
                      child: CustomTextStyle(text: AppLocalizations.of(context)?.translate("delete") ?? "Удалить", isBold: false),
                    ),
                  )
                ],
              ),
          
              SizedBox(height: 12),
              
              Container(
                padding: EdgeInsets.all(8),
                  child: CustomTextStyle(text: AppLocalizations.of(context)?.translate("add_new_address") ?? "Добавить новый адрес")
              ),
          
              SizedBox(height: 12),
          
              CustomTextField(hintText: "Алматы", width: double.infinity, controller: _cityController),
          
              SizedBox(height: 12),
              
              CustomTextField(hintText: "Улица и номер дома", width: double.infinity, controller: _streetController),
          
              SizedBox(height: 12),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(hintText: "Квартира", width: 100, controller: _apartment),
                  CustomTextField(hintText: "Подъезд", width: 100, controller: _entrance),
                  CustomTextField(hintText: "Этаж", width: 100, controller: _floor)
                ],
              ),
          
              SizedBox(height: 12,),
              
              CustomTextField(hintText: "Комментарий к адресу", width: double.infinity, controller: _comments),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Button(
              text: AppLocalizations.of(context)?.translate("add") ?? "Добавить",
              color: AppColors.orange,
              withIcon: false,
              onPressed: (){},
              width: double.infinity,
            ),
          )
      )
    );
  }

  @override
  void dispose(){
    _cityController.dispose();
    _streetController.dispose();
    _apartment.dispose();
    _entrance.dispose();
    _floor.dispose();
    _comments.dispose();
    super.dispose();
  }
}
