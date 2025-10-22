// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$stateAtom = Atom(name: '_LoginStore.state', context: context);

  @override
  LoginStoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoginStoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$scrollControllerAtom = Atom(
    name: '_LoginStore.scrollController',
    context: context,
  );

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$formKeyAtom = Atom(
    name: '_LoginStore.formKey',
    context: context,
  );

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$userControllerAtom = Atom(
    name: '_LoginStore.userController',
    context: context,
  );

  @override
  TextEditingController get userController {
    _$userControllerAtom.reportRead();
    return super.userController;
  }

  @override
  set userController(TextEditingController value) {
    _$userControllerAtom.reportWrite(value, super.userController, () {
      super.userController = value;
    });
  }

  late final _$passwordControllerAtom = Atom(
    name: '_LoginStore.passwordController',
    context: context,
  );

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$hasCredentialsAtom = Atom(
    name: '_LoginStore.hasCredentials',
    context: context,
  );

  @override
  bool get hasCredentials {
    _$hasCredentialsAtom.reportRead();
    return super.hasCredentials;
  }

  @override
  set hasCredentials(bool value) {
    _$hasCredentialsAtom.reportWrite(value, super.hasCredentials, () {
      super.hasCredentials = value;
    });
  }

  late final _$nameAtom = Atom(name: '_LoginStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_LoginStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$fotoAtom = Atom(name: '_LoginStore.foto', context: context);

  @override
  String get foto {
    _$fotoAtom.reportRead();
    return super.foto;
  }

  @override
  set foto(String value) {
    _$fotoAtom.reportWrite(value, super.foto, () {
      super.foto = value;
    });
  }

  late final _$onInitAsyncAction = AsyncAction(
    '_LoginStore.onInit',
    context: context,
  );

  @override
  Future<void> onInit(BuildContext context) {
    return _$onInitAsyncAction.run(() => super.onInit(context));
  }

  late final _$loginUserAsyncAction = AsyncAction(
    '_LoginStore.loginUser',
    context: context,
  );

  @override
  Future<void> loginUser(BuildContext context) {
    return _$loginUserAsyncAction.run(() => super.loginUser(context));
  }

  late final _$performLoginAsyncAction = AsyncAction(
    '_LoginStore.performLogin',
    context: context,
  );

  @override
  Future<void> performLogin(
    BuildContext context,
    String user,
    String password,
  ) {
    return _$performLoginAsyncAction.run(
      () => super.performLogin(context, user, password),
    );
  }

  late final _$tryFaceIDLoginAsyncAction = AsyncAction(
    '_LoginStore.tryFaceIDLogin',
    context: context,
  );

  @override
  Future<void> tryFaceIDLogin(BuildContext context) {
    return _$tryFaceIDLoginAsyncAction.run(() => super.tryFaceIDLogin(context));
  }

  late final _$_LoginStoreActionController = ActionController(
    name: '_LoginStore',
    context: context,
  );

  @override
  void scrollToTop() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
      name: '_LoginStore.scrollToTop',
    );
    try {
      return super.scrollToTop();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
      name: '_LoginStore.dispose',
    );
    try {
      return super.dispose();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
scrollController: ${scrollController},
formKey: ${formKey},
userController: ${userController},
passwordController: ${passwordController},
hasCredentials: ${hasCredentials},
name: ${name},
email: ${email},
foto: ${foto}
    ''';
  }
}
