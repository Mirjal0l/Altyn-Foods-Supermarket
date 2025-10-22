import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/orders/widgets/custom_list_item.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_empty_page.dart';
import 'package:homework1/widgets/custom_text_style.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final List<CustomListItem> orders = [
    CustomListItem(
      order_number: "213242354",
      date_purches: "4 февраля, 9:00",
      date_delivery: "4 февраля",
      consists: [
        Consists(
          name: "Молоко Простоквашино 2,5%, 950 мл",
          count: 1,
          price: 1310,
        ),
        Consists(
          name: "Молоко Простоквашино 2,5%, 950 мл",
          count: 1,
          price: 1310,
        ),
      ],
    ),

    CustomListItem(
      order_number: "213242354",
      date_purches: "4 февраля, 9:00",
      date_delivery: "4 февраля",
      consists: [
        Consists(
          name: "Молоко Простоквашино 2,5%, 950 мл",
          count: 1,
          price: 1310,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? Scaffold(
            body: CustomEmptyPage(
                hasImage: false,
                boldText: AppLocalizations.of(context)?.translate("not_ordered") ?? "not_ordered",
                subText: AppLocalizations.of(context)?.translate("search_on_catalogue") ?? "search_on_catalogue",
                buttonText: AppLocalizations.of(context)?.translate("go_to_catalogue") ?? "go_to_catalogue",
                onButtonClicked: (){
                  context.go(Routes.catalogue);
                }
            )
          )
        : Scaffold(
            backgroundColor: AppColors.background,
            appBar: CustomAppbar(
                hasLeading: false,
                title: AppLocalizations.of(context)?.translate("order_history") ?? "orders history",
                hasActions: false
            ),

            body: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return CustomListItem(
                  order_number: orders[index].order_number,
                  date_purches: orders[index].date_purches,
                  date_delivery: orders[index].date_delivery,
                  consists: orders[index].consists,
                );
              },
            ),
        );
  }
}
