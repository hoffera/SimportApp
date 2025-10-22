// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??= Computed<bool>(
    () => super.isLoading,
    name: '_ThemeStore.isLoading',
  )).value;

  late final _$isDarkModeAtom = Atom(
    name: '_ThemeStore.isDarkMode',
    context: context,
  );

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$stateAtom = Atom(name: '_ThemeStore.state', context: context);

  @override
  ThemeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ThemeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$simportThemeModelAtom = Atom(
    name: '_ThemeStore.simportThemeModel',
    context: context,
  );

  @override
  ThemeModel? get simportThemeModel {
    _$simportThemeModelAtom.reportRead();
    return super.simportThemeModel;
  }

  @override
  set simportThemeModel(ThemeModel? value) {
    _$simportThemeModelAtom.reportWrite(value, super.simportThemeModel, () {
      super.simportThemeModel = value;
    });
  }

  late final _$clientThemeModelAtom = Atom(
    name: '_ThemeStore.clientThemeModel',
    context: context,
  );

  @override
  ThemeModel? get clientThemeModel {
    _$clientThemeModelAtom.reportRead();
    return super.clientThemeModel;
  }

  @override
  set clientThemeModel(ThemeModel? value) {
    _$clientThemeModelAtom.reportWrite(value, super.clientThemeModel, () {
      super.clientThemeModel = value;
    });
  }

  late final _$selectedSimportThemeAtom = Atom(
    name: '_ThemeStore.selectedSimportTheme',
    context: context,
  );

  @override
  ThemeData? get selectedSimportTheme {
    _$selectedSimportThemeAtom.reportRead();
    return super.selectedSimportTheme;
  }

  @override
  set selectedSimportTheme(ThemeData? value) {
    _$selectedSimportThemeAtom.reportWrite(
      value,
      super.selectedSimportTheme,
      () {
        super.selectedSimportTheme = value;
      },
    );
  }

  late final _$selectedClientThemeAtom = Atom(
    name: '_ThemeStore.selectedClientTheme',
    context: context,
  );

  @override
  ThemeData? get selectedClientTheme {
    _$selectedClientThemeAtom.reportRead();
    return super.selectedClientTheme;
  }

  @override
  set selectedClientTheme(ThemeData? value) {
    _$selectedClientThemeAtom.reportWrite(value, super.selectedClientTheme, () {
      super.selectedClientTheme = value;
    });
  }

  late final _$themeDefaultAtom = Atom(
    name: '_ThemeStore.themeDefault',
    context: context,
  );

  @override
  ThemeData get themeDefault {
    _$themeDefaultAtom.reportRead();
    return super.themeDefault;
  }

  @override
  set themeDefault(ThemeData value) {
    _$themeDefaultAtom.reportWrite(value, super.themeDefault, () {
      super.themeDefault = value;
    });
  }

  late final _$getThemeByIdAsyncAction = AsyncAction(
    '_ThemeStore.getThemeById',
    context: context,
  );

  @override
  Future<void> getThemeById(int themeId) {
    return _$getThemeByIdAsyncAction.run(() => super.getThemeById(themeId));
  }

  late final _$_ThemeStoreActionController = ActionController(
    name: '_ThemeStore',
    context: context,
  );

  @override
  void saveThemeDefault(ThemeData theme) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.saveThemeDefault',
    );
    try {
      return super.saveThemeDefault(theme);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveSimportThemeModel(ThemeModel theme) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.saveSimportThemeModel',
    );
    try {
      return super.saveSimportThemeModel(theme);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedSimportTheme(bool isDarkMode) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.setSelectedSimportTheme',
    );
    try {
      return super.setSelectedSimportTheme(isDarkMode);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedClientTheme(bool isDarkMode) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.setSelectedClientTheme',
    );
    try {
      return super.setSelectedClientTheme(isDarkMode);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDarkMode(bool value) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.setDarkMode',
    );
    try {
      return super.setDarkMode(value);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
state: ${state},
simportThemeModel: ${simportThemeModel},
clientThemeModel: ${clientThemeModel},
selectedSimportTheme: ${selectedSimportTheme},
selectedClientTheme: ${selectedClientTheme},
themeDefault: ${themeDefault},
isLoading: ${isLoading}
    ''';
  }
}
