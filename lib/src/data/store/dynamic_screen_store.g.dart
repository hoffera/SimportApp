// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DynamicScreenStore on _DynamicScreenStore, Store {
  late final _$stateAtom = Atom(
    name: '_DynamicScreenStore.state',
    context: context,
  );

  @override
  DynamicScreenState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DynamicScreenState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$viewAtom = Atom(
    name: '_DynamicScreenStore.view',
    context: context,
  );

  @override
  ViewModel? get view {
    _$viewAtom.reportRead();
    return super.view;
  }

  @override
  set view(ViewModel? value) {
    _$viewAtom.reportWrite(value, super.view, () {
      super.view = value;
    });
  }

  late final _$loadDynamicScreenAsyncAction = AsyncAction(
    '_DynamicScreenStore.loadDynamicScreen',
    context: context,
  );

  @override
  Future<void> loadDynamicScreen(int pageID) {
    return _$loadDynamicScreenAsyncAction.run(
      () => super.loadDynamicScreen(pageID),
    );
  }

  @override
  String toString() {
    return '''
state: ${state},
view: ${view}
    ''';
  }
}
