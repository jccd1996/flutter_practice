import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Material components',
      'appStructureNavigation': 'App structure and navigation',
      'example3PagesNav': 'Example with 3 pages',
      'example3PagesTab': 'Tab with 3 pages',
      'exampleTab': 'Ejemplo Tabs',
      'panelSlidesHorizontally': 'Panel that slides in horizontally',
      'drawerDemo': 'Drawer demo',
      'toolbarWithAnimation': 'Toolbar with animation',
      'collapsingToolbar': 'Collapsing toolbar',
      'animationPage': 'Animation Page',
      'searchBar': 'Barra de busqueda',
    },
    'es': {
      'title': 'Componentes de Material',
      'appStructureNavigation': 'Estructura de la aplicación y navegación',
      'example3PagesNav': 'Ejemplo con 3 pagínas',
      'example3PagesTab': 'Tabs con 3 pagínas',
      'exampleTab': 'Tabs demo',
      'panelSlidesHorizontally': 'Panel que se desliza horizontalmente',
      'drawerDemo': 'Demostracion del drawer',
      'toolbarWithAnimation': 'Barra de navegación con animación',
      'collapsingToolbar': 'Toolbar con animación',
      'animationPage': 'Animación',
      'searchBar': 'Barra de busqueda',
    },
  };

  String get title => _localizedValues[locale.languageCode]['title'];

  String get appStructureNavigation =>
      _localizedValues[locale.languageCode]['appStructureNavigation'];

  String get example3PagesNav =>
      _localizedValues[locale.languageCode]['example3PagesNav'];

  String get example3PagesTab =>
      _localizedValues[locale.languageCode]['example3PagesTab'];

  String get exampleTab => _localizedValues[locale.languageCode]['exampleTab'];

  String get panelSlidesHorizontally =>
      _localizedValues[locale.languageCode]['panelSlidesHorizontally'];

  String get drawerDemo => _localizedValues[locale.languageCode]['drawerDemo'];

  String get toolbarWithAnimation => _localizedValues[locale.languageCode]['toolbarWithAnimation'];

  String get collapsingToolbar => _localizedValues[locale.languageCode]['collapsingToolbar'];

  String get animationPage => _localizedValues[locale.languageCode]['animationPage'];

  String get searchBar => _localizedValues[locale.languageCode]['searchBar'];
}
