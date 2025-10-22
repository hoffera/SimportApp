import "package:flutter/material.dart";
import "package:json_app/src/data/services/auth_notifier.dart";
import "package:json_app/src/data/services/face_id_service.dart";
import "package:json_app/src/data/services/secure_storage_service.dart";
import "package:json_app/src/data/store/user_store.dart";
import "package:mobx/mobx.dart";
import "package:simport_design_system/widgets/snackbar/snackbar_widget.dart";

import "../../../main.dart";

part "login_store.g.dart";

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  LoginStoreState state = LoginStoreState.empty;

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController userController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool hasCredentials = false;

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String foto = "";
  @action
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @action
  void dispose() {
    scrollController.dispose();
    userController.dispose();
    passwordController.dispose();
  }

  @action
  Future<void> onInit(BuildContext context) async {
    final secureStorageService = SecureStorageService();
    final creds = await secureStorageService.getCredentials();
    hasCredentials = await secureStorageService.hasCredentials();
    name = creds["name"] ?? "";
    email = creds["login"] ?? "";
    foto = creds["fotoId"] ?? "";
  }

  @action
  Future<void> loginUser(BuildContext context) async {
    final user = userController.text.trim();
    final password = passwordController.text.trim();

    final formState = formKey.currentState;
    if (formState == null) {
      return;
    }

    if (!formState.validate()) {
      return;
    }

    await performLogin(context, user, password);
  }

  @action
  Future<void> performLogin(
    BuildContext context,
    String user,
    String password,
  ) async {
    user = user.toLowerCase();
    try {
      final userStore = getIt<UserStore>();
      await userStore.loginUser(user, password);

      userController.clear();
      passwordController.clear();

      await getIt<AuthNotifier>().refresh();
      await SecureStorageService().saveCredentials(
        user,
        userStore.currentUser?.name ?? "",
        userStore.currentUser?.photoId,
        password,
      );
    } catch (e) {
      if (context.mounted) {
        showTopSnackBar(context, e.toString(), true);
      }
    }
  }

  @action
  Future<void> tryFaceIDLogin(BuildContext context) async {
    final SecureStorageService secureStorageService = SecureStorageService();
    try {
      final creds = await secureStorageService.getCredentials();
      final login = creds["login"];
      final password = creds["password"];

      if (login == null || password == null) {
        await secureStorageService.clearCredentials();
        return;
      }

      final FaceIDService faceIDService = FaceIDService();
      bool authenticated = await faceIDService.authenticate();
      if (!authenticated) {
        await secureStorageService.clearCredentials();
        return;
      }

      if (context.mounted) {
        await performLogin(context, login, password);
      }
    } catch (e) {
      await secureStorageService.clearCredentials();
      if (context.mounted) {
        showTopSnackBar(context, "Falha ao tentar login com Face ID.", true);
      }
    }
  }
}

enum LoginStoreState { loading, success, error, empty }
