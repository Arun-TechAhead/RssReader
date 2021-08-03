import 'package:flutter/widgets.dart';

class Strings {
  static Strings of(
    BuildContext context,
  ) {
    return Localizations.of<Strings>(context, Strings);
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  @override
  Future<Strings> load(Locale locale) => Future(() => Strings());

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => true;

  @override
  bool isSupported(Locale locale) => true;
}
