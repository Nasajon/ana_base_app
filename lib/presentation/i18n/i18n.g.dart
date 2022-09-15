/// Generated file. Do not edit.
///
/// Locales: 1
/// Strings: 2
///
/// Built on 2022-09-13 at 13:56 UTC


// coverage:ignore-file
// ignore_for_file: type=lint


import 'package:flutter/widgets.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.pt;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.pt) // set locale
/// - Locale locale = AppLocale.pt.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.pt) // locale check
enum AppLocale with BaseAppLocale<I18nPt> {
	pt(languageCode: 'pt', build: I18nPt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<I18nPt> build;
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, I18nPt> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
}

// translations

// Path: <root>
class I18nPt implements BaseTranslations {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	I18nPt.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	final PluralResolver? _cardinalResolver; // ignore: unused_field
	final PluralResolver? _ordinalResolver; // ignore: unused_field

	late final I18nPt _root = this; // ignore: unused_field

	// Translations
	late final I18nAnaPt ana = I18nAnaPt._(_root);
}

// Path: ana
class I18nAnaPt {
	I18nAnaPt._(this._root);

	final I18nPt _root; // ignore: unused_field

	// Translations
	late final I18nAnaAppsPt apps = I18nAnaAppsPt._(_root);
}

// Path: ana.apps
class I18nAnaAppsPt {
	I18nAnaAppsPt._(this._root);

	final I18nPt _root; // ignore: unused_field

	// Translations
	String get skeleton => 'Skeleton';
	String get meuTrabalho => 'Meu Trabalho';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on I18nPt {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'ana.apps.skeleton': 'Skeleton',
			'ana.apps.meuTrabalho': 'Meu Trabalho',
		};
	}
}
