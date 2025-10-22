import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/button.dart';

class CustomListItem extends StatefulWidget {
  final String order_number;
  final String date_purches;
  final String date_delivery;
  final List<Consists> consists;

  const CustomListItem({
    super.key,
    required this.order_number,
    required this.date_purches,
    required this.date_delivery,
    required this.consists,
  });

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    int totalPrice = widget.consists.fold(0, (sum, item) => sum + item.price);

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      Text(
                        "${AppLocalizations.of(context)?.translate("order_number") ?? "Order Number"} ${widget.order_number}",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          color: AppColors.light_black,
                          letterSpacing: 0,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        widget.date_purches,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark_gray,
                          letterSpacing: 0,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "${AppLocalizations.of(context)?.translate("delivered") ?? "Delivered"} ${widget.date_delivery}",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: AppColors.light_green,
                          letterSpacing: 0,
                        ),
                      ),

                    ],
                  ),
                ),

                Card(
                  color: AppColors.unpressable_orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: Image.asset(
                      'assets/images/cup_of_coffee.png',
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.translate("compound") ??
                      "Compound",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: AppColors.dark_gray,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(width: 4),
                dropDownButton(),
              ],
            ),

            if (_isExpanded) ...[
              Column(
                children: [
                  // Fix the ConsistsItemWidget to prevent overflow
                  ...widget.consists
                      .map((item) => ConsistsItemWidget(item: item))
                      .toList(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)?.translate("total_including") ?? "Total including:"} $totalPrice T",
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ],

            Button(
              text: AppLocalizations.of(context)?.translate("repeat") ?? "Repeat",
              color: AppColors.orange,
              withIcon: false,
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget dropDownButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      icon: SvgPicture.asset(
        "assets/icons/drop_down.svg",
        color: AppColors.dark_gray,
        width: 24,
        height: 24,
      ),
    );
  }
}

class Consists {
  final String name;
  final int count;
  final int price;

  const Consists({
    required this.name,
    required this.count,
    required this.price,
  });
}

class ConsistsItemWidget extends StatelessWidget {
  final Consists item;

  const ConsistsItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Use Expanded to distribute space properly
          Expanded(
            flex: 2, // Give more space to the name
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                color: AppColors.light_black,
                letterSpacing: 0,
              ),
              overflow: TextOverflow.ellipsis, // Handle long text
              maxLines: 1,
            ),
          ),

          SizedBox(width: 8),

          Expanded(
            child: Text(
              "${item.count} pcs",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                color: AppColors.light_black,
                letterSpacing: 0,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(width: 8),

          Expanded(
            child: Text(
              "${item.price} T",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                color: AppColors.orange,
                letterSpacing: 0,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}