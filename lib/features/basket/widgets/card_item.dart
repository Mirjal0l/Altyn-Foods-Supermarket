import 'package:flutter/material.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';

class CardItem extends StatefulWidget {
  final String title;
  final int price;
  final String image;
  final bool isFavorite;

  const CardItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.isFavorite = false
  });

  @override
  State<CardItem> createState() => CardItemState();
}

class CardItemState extends State<CardItem> {
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  bool isFavorite = false;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.image,
                  width: 100,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                  top: 8,
                  right: 8,
                  child: isFavorite ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(Icons.favorite, size: 21, color: AppColors.orange),
                  ) : GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(Icons.favorite_border, size: 21, color: AppColors.orange),
                      )
              )
            ]
          ),

          SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: AppColors.light_black
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),

                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.close)
                      , color: AppColors.dark_gray,
                      constraints: BoxConstraints(minHeight: 24, minWidth: 24),
                    )
                  ],
                ),

                Text(
                  "${widget.price} ${AppLocalizations.of(context)?.translate("tsht") ?? "tsht"}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    color: AppColors.dark_gray,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 103,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.light_gray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  count = 0;
                                });
                              },
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(minWidth: 24, minHeight: 24),
                              icon: Icon(Icons.delete, color: AppColors.dark_gray, size: 18,),
                          ),

                          Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              color: AppColors.dark_gray
                            ),
                          ),

                          IconButton(
                              onPressed: () {
                                setState(() {
                                  count ++;
                                });
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(minHeight: 24, minWidth: 24),
                              icon: Icon(Icons.add, color: AppColors.dark_gray, size: 18)
                          )
                        ],
                      ),
                    ),

                    Text(
                      "${widget.price} T",
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),

          SizedBox(width: 8)
        ],
      ),
    );
  }
}

class Items {
  String title;
  int price;
  String image;
  bool isFavorite;

  Items({
    required this.title,
    required this.price,
    required this.image,
    required this.isFavorite
  });
}
