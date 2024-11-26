import 'package:common/l10n/generated/l10n.dart';
import 'package:flutter/widgets.dart';

extension BuildContextX on BuildContext {
  String get languageCode => Localizations.localeOf(this).toLanguageTag();

  L10N get translations => L10N.of(this);
}
