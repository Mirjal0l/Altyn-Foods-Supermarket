
import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/basket/widgets/card_item.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_empty_page.dart';
import 'package:homework1/widgets/custom_text_style.dart';

import '../../widgets/price_tag.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  String? selectedValue = "Алматы";

  final List<String> _items = [
    // "Выберите адрес",
    "Алматы",
    "Астана",
    "Шымкент",
    "Караганда",
    "Актобе",
    "Тараз",
  ];

  final List<Items> cardItems = [
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
    Items(title: "Молоко Простоквашино 2,5%, 950 мл", price: 1310, image: "assets/images/milk.jpg", isFavorite: false),
  ];

  final List<String> images = [
    "assets/images/ice_cream.png",
    "assets/images/chocolate.png",
    "assets/images/coffee.png"
  ];

  void toggleFavorite(int index) {
    setState(() {
      cardItems[index].isFavorite = !cardItems[index].isFavorite;
    });
  }

  void clearFavorites() {
    setState(() {
      cardItems.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    final fixedPrices = List.unmodifiable(
      [for (final item in cardItems)item.price],
    );

    final String hintText = "${AppLocalizations.of(context)?.translate("select_address") ?? "select_address"}".toString();
    return cardItems.isEmpty ? 
        Scaffold(
          body: CustomEmptyPage(
            hasImage: true,
            image: "assets/images/basket.png",
            imageHeight: 150,
            imageWidth: 200,
            boldText: AppLocalizations.of(context)?.translate("card_empty") ?? "Card empty",
            subText: AppLocalizations.of(context)?.translate("card_empty_subtext") ?? "Card empty subtext",
            buttonText: AppLocalizations.of(context)?.translate("add_to_card") ?? "Add to catalogue",
            onButtonClicked: () {
              context.go(Routes.catalogue);
            }
          )
        )
        : Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppbar(
          hasLeading: false,
          title: AppLocalizations.of(context)?.translate("basket") ?? "Basket",
          hasActions: true,
        actionTitle: AppLocalizations.of(context)?.translate("clear") ?? "Clear",
        onActionClicked: clearFavorites,
      ),

      body: Container(
        height: double.infinity,
        color: AppColors.background,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                hintText,
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
          
          
              Container(
                height: 0.25 * MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: cardItems.length,
                  itemBuilder: (context, index) {
                    final item = cardItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: CardItem(
                        title: item.title,
                        price: item.price,
                        image: item.image,
                        isFavorite: item.isFavorite,
                      ),
                    );
                  },
                ),
              ),
          
              SizedBox(height: 8),
          
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/green_background.png",
                          ),
                        colorFilter: ColorFilter.mode(
                            Colors.green.withOpacity(1),
                            BlendMode.screen
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
          
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            padding: EdgeInsets.only(left: 8, top: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)?.translate("promo_code_text") ?? "promo text",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Inter",
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                Text(
                                  AppLocalizations.of(context)?.translate("minimum_amount") ?? "minimum amount",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter",
                                    color: AppColors.white
                                  ),
                                ),

                                SizedBox(
                                  width: 80,
                                  height: 30,
                                  child: ElevatedButton(
                                      onPressed: (){},
                                      child: Text(
                                        "MWD241",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Inter",
                                          color: AppColors.white
                                        ),
                                      ),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                      backgroundColor: AppColors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24)
                                      )
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: CarouselSlider(
                              items: images.map((image) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image(
                                    image: AssetImage(image),
                                    fit: BoxFit.cover
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 130,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(milliseconds: 500),
                                autoPlayCurve: Curves.easeInOut,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                reverse: false,
                                initialPage: 1
                              )
                          ),
                        )
                      ],
                    ),
                  )
                ]
              ),
          
              SizedBox(height: 8,),
          
              CustomTextStyle(
                  text: AppLocalizations.of(context)?.translate("we_recommend") ?? "We recommend",
                isBold: true,
                isCenter: false,
              ),
          
              SizedBox(height: 8,),
          
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: fixedPrices.length,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 0.44 * MediaQuery.of(context).size.width,
                        height: 200,
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image(image: AssetImage(cardItems[index].image),
                                    fit: BoxFit.cover,
                                    width: 0.44 * MediaQuery.of(context).size.width,
                                    height: 100,
                                  ),
                                ),
                                Positioned(
                                    top: 6,
                                    right: 6,
                                    child: GestureDetector(
                                      onTap: () {
                                        toggleFavorite(index);
                                      },
                                      child: cardItems[index].isFavorite
                                          ? Icon(Icons.favorite, color: AppColors.orange, size: 20) :
                                      Icon(Icons.favorite_border, color: AppColors.orange, size: 20),
                                    )
                                )
                              ],
                            ),
          
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardItems[index].title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter',
                                      color: AppColors.light_black,
                                    ),
                                  ),
          
                                  SizedBox(height: 6),
          
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        fixedPrices[index].toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          color: AppColors.dark_gray,
                                        ),
                                      ),
          
                                      Text(
                                        "1 ${AppLocalizations.of(context)?.translate("pieces") ?? " щт."}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            color: AppColors.light_green
                                        ),
                                      ),
          
                                      PriceTag(
                                          text: "+ ${cardItems[index].price} T",
                                          onPressed: () {
                                            setState(() {
                                              cardItems[index].price += cardItems[index].price;
                                            });
                                          }),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button(
            text: AppLocalizations.of(context)?.translate("proceed_to_payment") ?? "Proceed to payment",
            color: AppColors.orange,
            withIcon: false,
            onPressed: (){
              context.push(Routes.payment);
            },
            width: double.infinity
        ),
      ),
    );
  }
}
