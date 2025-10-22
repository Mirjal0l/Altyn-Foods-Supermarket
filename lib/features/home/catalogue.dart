import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/features/home/message.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/custom_text_style.dart';

import '../../core/utils/app_colors.dart';

class Catalogue extends StatefulWidget {
  final bool isActive;

  const Catalogue({super.key, this.isActive = false});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  bool viewAll = false;
  final _searchController = TextEditingController();

  // dropdown items
  String? selectedValue = "Алматы";

  final List<String> _items = [
    "Алматы",
    "Астана",
    "Шымкент",
    "Караганда",
    "Актобе",
    "Тараз",
  ];

  // All categories
  final List<Map<String, String>> allCategories = [
    {"title": "Акции", "image": "assets/images/discount.png"},
    {"title": "Продукты", "image": "assets/images/products.png"},
    {"title": "Вода и напитки", "image": "assets/images/drinks.png"},
    {"title": "Красота и здоровье", "image": "assets/images/beauty.png"},
    {"title": "Товары для детей", "image": "assets/images/toys.png"},
    {"title": "Бытовая химия", "image": "assets/images/chemicals.png"},
    {"title": "Дом и сад", "image": "assets/images/home_and_garden.png"},
    {"title": "Товары для животных", "image": "assets/images/pet_products.png"},
    {"title": "Алкоголь", "image": "assets/images/alcochole.png"},
    {
      "title": "Спортивное питание",
      "image": "assets/images/sports_nutritions.png",
    },
    {"title": "Особое питание", "image": "assets/images/special_foods.png"},
    {"title": "Готовая еда", "image": "assets/images/ready_foods.png"},
  ];

  // filtered categories based on search
  List<Map<String, String>> filteredCategories = [];

  bool? isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
    // filteredCategories = allCategories;
  }

  void _onSearchChanged(String value) {
    setState(() {
      filteredCategories = allCategories
          .where((category) =>
          category["title"]!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the viewport width from context implicitly (SliverToBoxAdapter will size child horizontally)
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16, right: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location_icon.svg",
                            width: 34,
                            height: 34,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)?.translate(
                                          "select_address") ?? "",
                                      style: TextStyle(
                                        color: AppColors.dark_gray,
                                        fontSize: 12,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      height: 24,
                                      child: DropdownButton(
                                        underline: const SizedBox(),
                                        value: selectedValue,
                                        icon: SvgPicture.asset(
                                          "assets/icons/drop_down.svg",
                                          width: 18,
                                          height: 18,
                                        ),
                                        selectedItemBuilder: (
                                            BuildContext context) {
                                          return _items.map<Widget>((
                                              String item) {
                                            return Container(width: 0);
                                          }).toList();
                                        },
                                        items: _items.map<
                                            DropdownMenuItem<String>>((
                                            String value) {
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
                        ],
                      ),
                    ),

                    // notification icon button
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => const Message()));
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/bell_notification.svg",
                        width: 24,
                        height: 24,
                        color: AppColors.light_black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: SizedBox(
                  height: 44,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,

                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.light_gray,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(32)
                      ),
                      hintText: AppLocalizations.of(context)
                          ?.translate("catalogue_search") ??
                          "search",
                      hintStyle: TextStyle(
                        color: AppColors.tab_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                      ),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: AppColors.light_gray,
                              width: 1
                          )
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: AppColors.light_gray,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),

            // Horizontal category bar (history-like)
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100, // fixed height for the horizontal list
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, index) {
                    // Example list of round items — static for demo
                    final items = [
                      {
                        "title": AppLocalizations.of(context)
                            ?.translate("news") ??
                            "news",
                        "image": "assets/images/news_round.png"
                      },
                      {
                        "title": AppLocalizations.of(context)
                            ?.translate("beauty") ??
                            "beauty",
                        "image": "assets/images/beauty_round.png"
                      },
                      {
                        "title": AppLocalizations.of(context)
                            ?.translate("discounts") ??
                            "discounts",
                        "image": "assets/images/discount_round.png"
                      },
                      {
                        "title": AppLocalizations.of(context)
                            ?.translate("hits") ??
                            "hits",
                        "image": "assets/images/hits_round.png"
                      },
                      {
                        "title": AppLocalizations.of(context)
                            ?.translate("novelty") ??
                            "novelty",
                        "image": "assets/images/beauty_round.png"
                      },
                    ];
                    final item = items[index];
                    return _buildRoundCategoryCard(
                        item["title"]!, item["image"]!);
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 8),
                  itemCount: 5,
                ),
              ),
            ),

            // SliverToBoxAdapter(
            //   child: SizedBox(height: 8),
            // ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextStyle(
                      text: AppLocalizations.of(context)?.translate(
                          "categories") ?? "categories",
                      isCenter: false,
                      isBold: true,
                      fontSize: 16,),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            viewAll = !viewAll;
                          });
                        },
                        child: Text(
                          AppLocalizations.of(context)?.translate("view_all") ??
                              "view all",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              color: AppColors.dark_gray
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),

            viewAll ? SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 190 / 112
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final category = allCategories[index];
                  return _buildRectangleCategoryCard(category);
                },
                    childCount: allCategories.length
                ),
              ),
            ) : SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 190 / 112
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final category = filteredCategories[index];
                  return _buildRectangleCategoryCard(category);
                },
                    childCount: filteredCategories.length
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

Widget _buildRoundCategoryCard(String title, String imagePath) {
  return Container(
    height: 90,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                  color: AppColors.orange,
                  width: 2
              )
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              imagePath, width: 64, height: 64, fit: BoxFit.cover,),
          ),
        ),

        SizedBox(height: 4),

        SizedBox(
          width: 70,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
              color: AppColors.light_black,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    ),
  );
}

Widget _buildRectangleCategoryCard(Map<String, String> category) {
  return Container(
    width: 190,
    height: 112,
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.card_bg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  category["image"]!,
                  width: double.infinity,
                  height: 65,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 10,
            left: 10,
            child: SizedBox(
              width: 130,
              child: Text(
                category["title"].toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                  color: AppColors.light_black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
        )
      ]
    ),
  );
}