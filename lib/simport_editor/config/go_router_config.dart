import "dart:convert";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:json_app/app/pages/login_page/controllers/login_page_controller.dart";
import "package:json_app/app/pages/login_page/views/login_page_view.dart";
import "package:json_app/simport_editor/features/editor_client_page/view/editor_client_page.dart";
import "package:json_app/simport_editor/features/editor_home/view/editor_home_page_view.dart";
import "package:json_app/simport_editor/pages/code_json_page/controllers/code_json_controller.dart";
import "package:json_app/simport_editor/pages/code_json_page/view/code_json_view.dart";
import "package:json_app/simport_editor/pages/editor_home_page/controllers/editor_home_page_controller.dart";

class SimportEditorGoRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/login-page",
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: "/login-page",
        name: "login-page",
        builder: (context, state) {
          Get.put(LoginPageController());
          return const LoginPageView();
        },
      ),
      GoRoute(
        path: "/editor-home",
        name: "editor-home",
        builder: (context, state) {
          if (!Get.isRegistered<EditorHomePageController>()) {
            Get.put(EditorHomePageController());
          }
          return const EditorHomePageView();
        },
      ),

      GoRoute(
        path: "/editor-client/:clientId",
        name: "editor-client",
        builder: (context, state) {
          final String clientId = state.pathParameters["clientId"] ?? "";
          print("Navegando para editor-client com ID: $clientId");

          return EditorClientPage(clientId: clientId);
        },
      ),

      GoRoute(
        path: "/code-json/:json/:clientId",
        name: "code-json",
        pageBuilder: (context, state) {
          final String jsonParam = state.pathParameters["json"] ?? "{}";
          final String clientId = state.pathParameters["clientId"] ?? "";

          String decodedJson;
          try {
            final bytes = base64.decode(jsonParam);
            decodedJson = utf8.decode(bytes);
          } catch (e) {
            // Fallback para URL decoding se base64 falhar
            decodedJson = Uri.decodeComponent(jsonParam);
          }

          if (Get.isRegistered<CodeJsonController>()) {
            try {
              Get.delete<CodeJsonController>();
            } catch (e) {
              debugPrint(
                "[GoRouterConfig] Erro ao deletar CodeJsonController: $e",
              );
            }
          }

          try {
            final CodeJsonController newController = CodeJsonController(
              json: decodedJson,
              clientId: clientId,
            );
            Get.put<CodeJsonController>(newController);
          } catch (e) {
            debugPrint("[GoRouterConfig] Erro ao criar CodeJsonController: $e");
          }

          // Retorna a página normalmente
          return MaterialPage(key: state.pageKey, child: CodeJsonPageView());
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              "Página não encontrada: ${state.uri}",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go("/editor-home"),
              child: const Text("Voltar ao Início"),
            ),
          ],
        ),
      ),
    ),
  );
}
