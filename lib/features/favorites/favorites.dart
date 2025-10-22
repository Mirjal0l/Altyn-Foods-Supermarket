import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/home/catalogue.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_empty_page.dart';
import 'package:homework1/widgets/custom_text_style.dart';
import 'package:homework1/widgets/price_tag.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<Map<String, dynamic>> favorites = List.generate(5, (index) {
    return {
      "title": "Молоко Простоквашино 2,5%, 950 мл",
      "price": "1 310 T",
      "count": 1,
      "image": Image.asset("assets/images/milk.jpg", height: 100, width: double.infinity, fit: BoxFit.cover),
      "isFavorite": true,
    };
  });

  void toggleFavorite(int index) {
    setState(() {
      favorites[index]["isFavorite"] = !favorites[index]["isFavorite"];
    });
  }

  void clearFavorites() {
    setState(() {
      favorites.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty ?
    Scaffold( // ← Add Scaffold here
      body: CustomEmptyPage(
          hasImage: false,
          boldText: AppLocalizations.of(context)?.translate("no_favorites") ?? "no favorites",
          subText: AppLocalizations.of(context)?.translate("no_favorites_subtext") ?? "no favorites subtext",
          buttonText: AppLocalizations.of(context)?.translate("add_to_card") ?? "add to card",
          onButtonClicked: (){
            context.go(Routes.catalogue);
          }
      ),
    ) : Scaffold(
      appBar: CustomAppbar(
          hasLeading: false,
          title: AppLocalizations.of(context)?.translate("favorites") ?? "favorites",
          hasActions: true,
        actionTitle: AppLocalizations.of(context)?.translate("clear") ?? "clear",
        onActionClicked: () => _showClearFavoritesDialog(context),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: favorites.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.82
                    ),
                    itemBuilder: (context, index) {
                      return Container(
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
                                  child: favorites[index]["image"],
                                ),
                                Positioned(
                                    top: 6,
                                    right: 6,
                                    child: GestureDetector(
                                      onTap: () {
                                        toggleFavorite(index);
                                      },
                                      child: favorites[index]["isFavorite"]
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
                                    favorites[index]["title"],
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
                                        favorites[index]["price"],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          color: AppColors.dark_gray,
                                        ),
                                      ),

                                      Text(
                                        "${favorites[index]["count"].toString()}  ${AppLocalizations.of(context)?.translate("pieces") ?? " щт."}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: AppColors.light_green
                                        ),
                                      ),

                                      PriceTag(text: "+ 1 310 T", onPressed: () {}),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Button(
            text: AppLocalizations.of(context)?.translate("add_to_card") ?? "Добавить в корзину",
            color: AppColors.orange,
            withIcon: false,
            onPressed: (){
              context.go(Routes.catalogue);
            },
            width: double.infinity
        ),
      ),
    );
  }

  void _showClearFavoritesDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: AppColors.transparent,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.unpressable_orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                      "assets/icons/clear_icon.svg",
                    width: 60,
                    height: 60,
                  ),

                ),

                SizedBox(height: 20),

                CustomTextStyle(text: AppLocalizations.of(context)?.translate("clear_favorites") ?? "Очистить избранное", isBold: true, isCenter: true,),

                SizedBox(height: 20),

                CustomTextStyle(text: AppLocalizations.of(context)?.translate("really_want_to_clear") ?? "Вы действительно хотите очистить избранное? Вернуть все товары будет невозможно", isBold: false, isCenter: true),

                SizedBox(height: 20),

                Button(
                    text: AppLocalizations.of(context)?.translate("confirm") ?? "Подтвердить",
                    color: AppColors.orange,
                    withIcon: false,
                    onPressed: (){
                      Navigator.pop(context);
                      // add logic
                      clearFavorites();
                    },
                    width: double.infinity
                )
              ],
            ),
          );
        },
    );
  }
}

