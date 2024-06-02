import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class KliqLocalization {
  const KliqLocalization();

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  List<LocalizationsDelegate<Object>> get delegates {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}

extension KliqExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
