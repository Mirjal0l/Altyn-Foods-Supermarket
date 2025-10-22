import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:homework1/widgets/custom_empty_page.dart';

class Confirmed extends StatelessWidget {
  const Confirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomEmptyPage(
          hasImage: true,
          image: "assets/images/on_the_way.png",
          imageWidth: 230,
          imageHeight: 230,
          boldText: AppLocalizations.of(context)?.translate("order_bold_text") ?? "order bold text",
          subText: AppLocalizations.of(context)?.translate("order_sub_text") ?? "order sub text",
          buttonText: AppLocalizations.of(context)?.translate("continue_ordering") ?? "continue ordering",
          onButtonClicked: () => context.go(Routes.catalogue),
      ),
    );
  }
}
