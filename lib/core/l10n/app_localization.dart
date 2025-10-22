import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations({
    required this.locale
  });

  static AppLocalizations? of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  late Map<String, String> _localizedValues = <String, String>{};

  String translate(String key) {
    if (_localizedValues.isNotEmpty) {
      return _localizedValues[key] ?? key;
    } else {
      return "";
    }
  }

  Future<void> load() async {
    final String jsonContent = await rootBundle.loadString("assets/locale/${locale.languageCode}.json");
    final Map<String, dynamic> jsonMap = json.decode(jsonContent);
    _localizedValues = jsonMap.map<String, String>(
            (String key, value) => MapEntry<String, String>(key, value.toString())
    );
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => <String>["ru", "uz", "en"].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async{
    final AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}