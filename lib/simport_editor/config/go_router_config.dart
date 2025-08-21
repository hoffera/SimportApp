import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:json_app/simport_editor/pages/code_json_page/code_json_page.dart";
import "package:json_app/simport_editor/pages/editor_client_page/controllers/editor_client_page_controller.dart";
import "package:json_app/simport_editor/pages/editor_client_page/views/editor_client_page_view.dart";
import "package:json_app/simport_editor/pages/editor_home_page/controllers/editor_home_page_controller.dart";
import "package:json_app/simport_editor/pages/editor_home_page/views/editor_home_page_view.dart";

class SimportEditorGoRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/editor-home",
    debugLogDiagnostics: true,
    routes: [
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

          if (Get.isRegistered<EditorClientPageController>()) {
            Get.delete<EditorClientPageController>();
          }
          final newcontroller = EditorClientPageController(clientId);
          Get.put(newcontroller);

          return EditorClientPageView(clientId: clientId);
        },
      ),
      GoRoute(
        path: "/code-json",
        name: "code-json",
        builder: (context, state) {
          final json = state.uri.queryParameters["json"] ?? "{}";
          final clientId = state.uri.queryParameters["clientId"] ?? "";
          print(
            "Navegando para code-json com JSON: ${json.substring(0, json.length > 50 ? 50 : json.length)}...",
          );
          return CodeJsonPage(json: json, clientId: clientId);
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
