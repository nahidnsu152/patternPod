import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// provider used to access the AppLocalizations object for the current locale
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  // set the initial locale
  ref.state = lookupAppLocalizations(PlatformDispatcher.instance.locale);
  // update afterwards
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(PlatformDispatcher.instance.locale);
  });
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
});

/// observed used to notify the caller when the locale changes
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
