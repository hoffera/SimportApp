import "package:get/get.dart";
import "package:json_app/app/components/snackbar/snackbar_widget.dart";
import "package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart";
import "package:json_app/app/pages/dynamic_json_page/views/dynamic_json_page_view.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class LoginPageController extends GetxController {
  final userController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final scrollController = ScrollController();

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

  void loginUser(BuildContext context) {
    final user = userController.text.trim();
    final password = passwordController.text.trim();

    if (formKey.currentState!.validate()) {
      print(user);
      print(password);
      showTopSnackBar(context, "Logado com sucesso!", false);
      userController.text != "" ? abrirCliente() : Get.toNamed("/home-page");
      userController.text = "";
      passwordController.text = "";
    } else {
      showTopSnackBar(context, "Erro ao entrar!", true);
    }
  }

  Future<void> abrirCliente() async {
    final placeholder = JsonWidgetData.fromDynamic({
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

    if (Get.isRegistered<DynamicJsonPageController>()) {
      Get.delete<DynamicJsonPageController>();
    }
    Get.put(DynamicJsonPageController(1));
    Get.to(DynamicJsonPageView(pageID: 1, placeholder: placeholder));
  }
}
