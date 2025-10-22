import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_empty_page.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("messages") ?? "Messages",
          hasActions: false
      ),
      body: CustomEmptyPage(
          hasImage: true,
          image: "assets/images/bell.png",
          imageHeight: 139,
          imageWidth: 129,
          boldText: AppLocalizations.of(context)?.translate("messages_bold_text") ?? "",
          subText: AppLocalizations.of(context)?.translate("messages_sub_text") ?? "",
      ),
    );
  }
}
