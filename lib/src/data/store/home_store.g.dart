// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$stateAtom = Atom(name: '_HomeStore.state', context: context);

  @override
  HomeStoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeStoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_HomeStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_HomeStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$selectClientAsyncAction = AsyncAction(
    '_HomeStore.selectClient',
    context: context,
  );

  @override
  Future<void> selectClient(ClientModel client, BuildContext context) {
    return _$selectClientAsyncAction.run(
      () => super.selectClient(client, context),
    );
  }

  late final _$loadHomeAsyncAction = AsyncAction(
    '_HomeStore.loadHome',
    context: context,
  );

  @override
  Future<void> loadHome() {
    return _$loadHomeAsyncAction.run(() => super.loadHome());
  }

  late final _$_HomeStoreActionController = ActionController(
    name: '_HomeStore',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
      name: '_HomeStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
searchQuery: ${searchQuery},
errorMessage: ${errorMessage}
    ''';
  }
}
