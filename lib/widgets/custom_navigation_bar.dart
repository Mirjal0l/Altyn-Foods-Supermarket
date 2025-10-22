import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/widgets/nav_bar_item.dart';
import 'package:homework1/router/name_routes.dart';

class CustomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomNavigationBar({super.key, required this.navigationShell});

  Widget _buildNavItem(
      BuildContext context, {
        required int index,
        required String icon,
        required String text,
      }
      ) {
    final bool isSelected = navigationShell.currentIndex == index;

    return GestureDetector(
      onTap: ()=> _onItemTapped(index, context),
      child: NavBar(
        icon: icon,
        text: text,
        isActive: isSelected,
        onPressed: () => _onItemTapped(index, context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.tab_color)),
        ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(
              context,
              index: 0,
              icon: 'assets/icons/home.svg',
              text: AppLocalizations.of(context)?.translate("catalogue") ?? "Каталог"
          ),
          _buildNavItem(
              context,
              index: 1,
              icon: 'assets/icons/saved.svg',
              text: AppLocalizations.of(context)?.translate("my_orders") ?? "Мои заказы"
          ),
          _buildNavItem(
              context,
              index: 2,
              icon: 'assets/icons/korzina.svg',
              text: AppLocalizations.of(context)?.translate("basket") ?? "Корзина"
          ),
          _buildNavItem(
              context,
              index: 3,
              icon: 'assets/icons/saved.svg',
              text: AppLocalizations.of(context)?.translate("favorites") ?? "Избранное"
          ),
          _buildNavItem(
              context,
              index: 4,
              icon: 'assets/icons/profile.svg',
              text: AppLocalizations.of(context)?.translate("profile") ?? "Профиль"
          ),
        ],
      ),
    );
  }
}
