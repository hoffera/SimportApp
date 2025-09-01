import "dart:convert";

import "package:flutter/material.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/app/models/curinga/curinga_model.dart";
import "package:json_app/app/models/curinga/curinga_service.dart";
import "package:json_app/simport_editor/widgets/code_editor/code_editor_widget.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:re_editor/re_editor.dart";

class CoringaPage extends StatelessWidget {
  CoringaPage({super.key});

  final CodeLineEditingController controller = CodeLineEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.contentColorWhite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_editor()],
      ),
    );
  }

  Widget _editor() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CodeEditorWidget(controller: controller),
      ),
    );
  }

  Widget _listaCoringas(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                "Curingas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: FutureBuilder<List<Curinga>>(
                future: CuringaService.fetchCuringas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.white70,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Erro ao carregar curingas",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Detalhes: ${snapshot.error.toString()}",
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                              fontFamily: "Comfortaa",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  final curingas = snapshot.data ?? [];
                  if (curingas.isEmpty) {
                    return const Center(
                      child: Text(
                        "Nenhum curinga encontrado",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: curingas.length,
                    itemBuilder: (context, index) {
                      final curinga = curingas[index];
                      return ListTile(
                        onTap: () {
                          if (curinga.args is String) {
                            controller.text = curinga.args as String;
                          } else {
                            controller.text = curinga.args != null
                                ? const JsonEncoder.withIndent(
                                    "  ",
                                  ).convert(curinga.args)
                                : "";
                          }
                        },
                        title: Text(
                          curinga.type,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
