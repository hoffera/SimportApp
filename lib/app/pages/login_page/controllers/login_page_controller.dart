import "package:get/get.dart";
import "package:json_app/app/components/snackbar/snackbar_widget.dart";
import "package:json_app/app/models/auth/login_response_model.dart";
import "package:json_app/app/services/auth_service_web.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class LoginPageController extends GetxController {
  final userController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final scrollController = ScrollController();

  /// Indica se está carregando o login
  final isLoading = false.obs;

  /// Armazena os dados do usuário logado
  final userData = Rxn<LoginResponseModel>();

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> loginUser(BuildContext context) async {
    final user = userController.text.trim();
    final password = passwordController.text.trim();

    if (formKey.currentState!.validate()) {
      await _performLogin(context, user, password);
    } else {
      showTopSnackBar(context, "Erro ao entrar!", true);
    }
  }

  Future<void> _performLogin(
    BuildContext context,
    String user,
    String password,
  ) async {
    try {
      isLoading.value = true;
      print("[LoginPageController._performLogin] Iniciando login para: $user");

      final LoginResponseModel loginResponse;

      loginResponse = await AuthServiceWeb.loginUser(
        username: user,
        password: password,
      );

      userData.value = loginResponse;

      // Verifica acesso usando o serviço apropriado
      final hasAccess = AuthServiceWeb.hasUserAccess(loginResponse);

      if (hasAccess) {
        print(
          "[LoginPageController._performLogin] Login bem-sucedido: ${loginResponse.name}",
        );
        showTopSnackBar(context, "Logado com sucesso!", false);

        userController.clear();
        passwordController.clear();
        showTopSnackBar(context, "Acesso!", false);
        // if (user.isNotEmpty) {
        //   await abrirCliente();
        // } else {
        //   Get.toNamed("/home-page");
        // }
      } else {
        print("[LoginPageController._performLogin] Usuário sem acesso");
        showTopSnackBar(context, "Usuário sem permissão!", true);
      }
    } catch (e) {
      print("[LoginPageController._performLogin] Erro no login: $e");
      showTopSnackBar(context, e.toString(), true);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> abrirCliente() async {
    final skeleton = JsonWidgetData.fromDynamic({
      "type": "scaffold",
      "args": {
        "backgroundColor": "#fff0faff",
        "body": {
          "type": "center",
          "args": {
            "child": {
              "type": "single_child_scroll_view",
              "args": {
                "child": {
                  "type": "padding",
                  "args": {
                    "padding": {
                      "bottom": 20,
                      "left": 20,
                      "right": 20,
                      "top": 20,
                    },
                    "child": {
                      "type": "container",
                      "args": {
                        "height": 180,
                        "width": 100,
                        "color": "#fff44336",
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
    }, registry: JsonWidgetRegistry.instance);
  }
}
