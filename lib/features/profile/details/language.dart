import 'package:flutter/material.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/main.dart';
import 'package:homework1/widgets/button.dart';
import 'package:homework1/widgets/custom_appbar.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String? selected;

  // String _currentLanguageCode = "ru"; // default language

  @override
  void initState() {
    super.initState();
    // _loadCurrentLanguage();
  }

  void _loadCurrentLanguage() {
    setState(() {
      selected = _getLanguageName(selected ?? "ru");
    });
  }

  String _getLanguageCode(String languageName) {
    switch (languageName) {
      case "Русский":
        return "ru";
      case "Узбекский":
        return "uz";
      case "Английский":
        return "en";
      default:
        return "ru";
    }
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case "ru":
        return "Русский";
      case "uz":
        return "Узбекский";
      case "en":
        return "Английский";
      default:
        return "Русский";
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("language") ?? "Язык",
          hasActions: false
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    radioButton(
                      AppLocalizations.of(context)?.translate("russian") ??
                          "Русский",
                    ),
                    radioButton(
                      AppLocalizations.of(context)?.translate("uzbek") ??
                          "Узбекский",
                    ),
                    radioButton(
                      AppLocalizations.of(context)?.translate("english") ??
                          "Английский",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button(
          text:
              AppLocalizations.of(context)?.translate("save_changes") ??
              "Сохранить изменения",
          color: AppColors.orange,
          withIcon: false,
          onPressed: selected != null ? () => _saveChanges() : null,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget radioButton(String value) {
    return RadioListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              height: 24 / 16,
              color: AppColors.light_black,
            ),
          ),
        ],
      ),
      value: value,
      groupValue: selected,
      activeColor: AppColors.orange,

      onChanged: (val) {
        setState(() {
          selected = val!;
        });
      },
    );
  }

  void _saveChanges() async {
    if (selected != null) {
      String _languageCode = _getLanguageCode(selected!);
      MyApp.setLocale(context, Locale(_languageCode));
      Navigator.pop(context);
    }
  }
}
