import 'package:common/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension TranslationBuildContext on BuildContext {
  String get languageCode => Localizations.localeOf(this).languageCode;

  AppLocalizations get translations => AppLocalizations.of(this);
}
