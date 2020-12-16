import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations({
    this.locale,
  });

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
