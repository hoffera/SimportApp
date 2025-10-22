// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on _LanguageStore, Store {
  late final _$currentLocaleAtom = Atom(
    name: '_LanguageStore.currentLocale',
    context: context,
  );

  @override
  Locale get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(Locale value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  late final _$currentLocalizationsAtom = Atom(
    name: '_LanguageStore.currentLocalizations',
    context: context,
  );

  @override
  AppLocalizations? get currentLocalizations {
    _$currentLocalizationsAtom.reportRead();
    return super.currentLocalizations;
  }

  @override
  set currentLocalizations(AppLocalizations? value) {
    _$currentLocalizationsAtom.reportWrite(
      value,
      super.currentLocalizations,
      () {
        super.currentLocalizations = value;
      },
    );
  }

  late final _$languageCodeAtom = Atom(
    name: '_LanguageStore.languageCode',
    context: context,
  );

  @override
  String get languageCode {
    _$languageCodeAtom.reportRead();
    return super.languageCode;
  }

  @override
  set languageCode(String value) {
    _$languageCodeAtom.reportWrite(value, super.languageCode, () {
      super.languageCode = value;
    });
  }

  late final _$setLocaleAsyncAction = AsyncAction(
    '_LanguageStore.setLocale',
    context: context,
  );

  @override
  Future<void> setLocale(Locale newLocale) {
    return _$setLocaleAsyncAction.run(() => super.setLocale(newLocale));
  }

  late final _$detectDeviceLanguageAsyncAction = AsyncAction(
    '_LanguageStore.detectDeviceLanguage',
    context: context,
  );

  @override
  Future<void> detectDeviceLanguage([Locale? locale]) {
    return _$detectDeviceLanguageAsyncAction.run(
      () => super.detectDeviceLanguage(locale),
    );
  }

  @override
  String toString() {
    return '''
currentLocale: ${currentLocale},
currentLocalizations: ${currentLocalizations},
languageCode: ${languageCode}
    ''';
  }
}
