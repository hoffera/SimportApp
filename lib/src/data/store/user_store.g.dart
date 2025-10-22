// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??= Computed<bool>(
    () => super.isLoggedIn,
    name: '_UserStore.isLoggedIn',
  )).value;

  late final _$currentUserAtom = Atom(
    name: '_UserStore.currentUser',
    context: context,
  );

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$currentImageUrlAtom = Atom(
    name: '_UserStore.currentImageUrl',
    context: context,
  );

  @override
  String? get currentImageUrl {
    _$currentImageUrlAtom.reportRead();
    return super.currentImageUrl;
  }

  @override
  set currentImageUrl(String? value) {
    _$currentImageUrlAtom.reportWrite(value, super.currentImageUrl, () {
      super.currentImageUrl = value;
    });
  }

  late final _$stateAtom = Atom(name: '_UserStore.state', context: context);

  @override
  UserStoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UserStoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$isInitializedAtom = Atom(
    name: '_UserStore.isInitialized',
    context: context,
  );

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$loginUserAsyncAction = AsyncAction(
    '_UserStore.loginUser',
    context: context,
  );

  @override
  Future<void> loginUser(String username, String password) {
    return _$loginUserAsyncAction.run(
      () => super.loginUser(username, password),
    );
  }

  late final _$saveCurrentUserAsyncAction = AsyncAction(
    '_UserStore.saveCurrentUser',
    context: context,
  );

  @override
  Future<void> saveCurrentUser(UserModel user) {
    return _$saveCurrentUserAsyncAction.run(() => super.saveCurrentUser(user));
  }

  late final _$loadUserAsyncAction = AsyncAction(
    '_UserStore.loadUser',
    context: context,
  );

  @override
  Future<void> loadUser() {
    return _$loadUserAsyncAction.run(() => super.loadUser());
  }

  late final _$refreshAsyncAction = AsyncAction(
    '_UserStore.refresh',
    context: context,
  );

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_UserStoreActionController = ActionController(
    name: '_UserStore',
    context: context,
  );

  @override
  void logout() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
      name: '_UserStore.logout',
    );
    try {
      return super.logout();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
currentImageUrl: ${currentImageUrl},
state: ${state},
isInitialized: ${isInitialized},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
