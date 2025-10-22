import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/basket/widgets/card_item.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_text_field.dart';
import 'package:homework1/widgets/custom_text_style.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _promo_code_controller = TextEditingController();
  final _date_controller = TextEditingController();
  final _time_controller = TextEditingController();
  final _comment_controller = TextEditingController();
  final List<Items2> items = [
    Items2(name: "Молоко Простоквашино 2,5%, 950 мл", count: 1, price: 1310),
    Items2(name: "Молоко Простоквашино 2,5%, 950 мл", count: 1, price: 1310),
  ];

  final List<String> _items = [
    // "Выберите адрес",
    "Алматы",
    "Астана",
    "Шымкент",
    "Караганда",
    "Актобе",
    "Тараз",
  ];

  String? selectedValue = "Алматы";
  String? selectedPayment = "Cash";
  @override
  Widget build(BuildContext context) {
    int sum = 0;
    for(int i = 0; i < items.length; i++) {
      sum = sum + items[i].price;
    }
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("order_details") ?? "order details",
          hasActions: false
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: Text(
                                items[index].name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  color: AppColors.light_black
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Text(
                              "${items[index].count} ${AppLocalizations.of(context)?.translate("pieces") ?? "pieces"}",
                              style: TextStyle(
                                color: AppColors.light_black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Text(
                              "${items[index].price} T",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Inter",
                              ),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),

              SizedBox(
                width: double.infinity,
                child: Text(
                  "${AppLocalizations.of(context)?.translate("total_including") ??
                  "total including"} $sum T",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.orange,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                  ),
                  textAlign: TextAlign.end,
                ),
              ),

              SizedBox(height: 16),
              
              CustomTextStyle(
                  text: AppLocalizations.of(context)?.translate("use_promo_code") ?? "use promo code",
                isBold: true,
                isCenter: false,
                fontSize: 16,
              ),
              
              SizedBox(height: 16),
              
              CustomTextField(
                  hintText: AppLocalizations.of(context)?.translate("promo_code") ?? "promo code",
                  width: double.infinity,
                  controller: _promo_code_controller
              ),

              SizedBox(height: 16),

              CustomTextStyle(
                  text: AppLocalizations.of(context)?.translate("enter_your_delivery_address") ?? "enter your delivery address",
                isBold: true,
                isCenter: false,
                fontSize: 16,
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/location_icon.svg",
                    width: 34,
                    height: 34,
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)?.translate("select_address") ?? "select address",
                                style: TextStyle(
                                  color: AppColors.dark_gray,
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.16,
                                ),
                              ),

                              SizedBox(width: 4),

                              SizedBox(
                                width: 80,
                                height: 24,
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  value: selectedValue,
                                  icon: SvgPicture.asset(
                                    "assets/icons/drop_down.svg",
                                    width: 18,
                                    height: 18,
                                  ),
                                  selectedItemBuilder: (BuildContext context) {
                                    return _items.map<Widget>((String item) {
                                      return Container(width: 0);
                                    }).toList();
                                  },
                                  items: _items.map<DropdownMenuItem<String>>((
                                      String value,
                                      ) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  isExpanded: false,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            selectedValue.toString(),
                            style: TextStyle(
                              color: AppColors.light_black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextStyle(
                            text: AppLocalizations.of(context)?.translate("date") ?? "date",
                            isCenter: false,
                            isBold: true,
                            fontSize: 16,
                          ),

                          SizedBox(height: 16),

                          CustomTextField(
                              hintText: "",
                              width: MediaQuery.of(context).size.width / 2,
                              controller: _date_controller
                          ),
                        ],
                      ),
                  ),

                  SizedBox(width: 16),

                  Expanded(
                    flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextStyle(
                            text: AppLocalizations.of(context)?.translate("time") ?? "time",
                            isCenter: false,
                            isBold: true,
                            fontSize: 16,
                          ),

                          SizedBox(height: 16),

                          CustomTextField(
                              hintText: "",
                              width: MediaQuery.of(context).size.width / 2,
                              controller: _date_controller
                          ),
                        ]
                      )
                  )
                ],
              ),
              
              SizedBox(height: 16),
              
              CustomTextStyle(
                text: AppLocalizations.of(context)?.translate("comment_on_the_order") ?? "comment_on_the_order",
                isBold: true,
                isCenter: false,
                fontSize: 16,
              ),

              SizedBox(height: 16),

              SizedBox(
                height: 142,
                child: CustomTextField(
                    hintText: AppLocalizations.of(context)?.translate("enter_text") ?? "enter text",
                    width: double.infinity,
                    controller: _comment_controller
                ),
              ),

              SizedBox(height: 16),

              CustomTextStyle(
                text: AppLocalizations.of(context)?.translate("select_payment_option") ?? "select payment option",
                isBold: true,
                isCenter: false,
                fontSize: 16
              ),

              SizedBox(height: 16),

              RadioListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.translate("cash") ?? "Cash",
                      style: TextStyle(
                        color: AppColors.light_black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    )
                  ],
                ),
                  value: AppLocalizations.of(context)?.translate("cash") ?? "Cash",
                groupValue: selectedPayment,
                activeColor: AppColors.orange,
                onChanged: (val) {
                  setState(() {
                    selectedPayment = val!;
                  }
                );
              },
              ),

              RadioListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.translate("bank_card") ?? "bank card",
                      style: TextStyle(
                        color: AppColors.light_black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
                value: AppLocalizations.of(context)?.translate("bank_card") ?? "Bank card",
                groupValue: selectedPayment,
                activeColor: AppColors.orange,
                onChanged: (val) {
                  setState(() {
                    selectedPayment = val!;
                  });
                },
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.0),
        child: Button(
            text: AppLocalizations.of(context)?.translate("order") ?? "order",
            color: AppColors.orange,
            withIcon: false,
            onPressed: () {
              context.push(Routes.confirmed);
            },
            width: double.infinity
        ),
      ),
    );
  }
}

class Items2 {
  String name;
  int count;
  int price;

  Items2({
    required this.name,
    required this.count,
    required this.price,
  });
}