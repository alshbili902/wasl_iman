import 'package:flutter/material.dart';
import 'package:wasl_iman/localization/app_localizations.dart';

extension ContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
