import "dart:convert";

import "package:get/get.dart";
import "package:graphite/core/typings.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_app/app/models/curinga/curinga_service.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class ConexoesService {
  Future<List<Client>> carregarClientes() async {
    try {
      return await ClientService.fetchClients();
    } catch (e) {
      print("Erro: $e");
      return [];
    }
  }

  Future<void> carregarCliente(String clientId) async {
    try {
      Client? client = await ClientService.findById(clientId);

      if (client?.views != null) {
        List<ViewClass> views = client!.views!;

        await initializeGraph(views);
      } else {
        print("Cliente não encontrado ou sem views: $clientId");
      }
    } catch (e) {
      return;
    }
  }

  Future<List<NodeInput>> initializeGraph(List<ViewClass> views) async {
    if (views.isEmpty) {
      print("Nenhuma view disponível para inicializar o gráfico");
      return [];
    }
    try {
      final principal = views.firstWhere(
        (v) => v.principal == true,
        orElse: () => throw Exception("Nenhuma view principal encontrada"),
      );
      final List<NodeInput> nodes = [];
      nodes.add(
        NodeInput(
          id: principal.id.toString(),
          size: const NodeSize(width: 150, height: 300),
          next: [],
        ),
      );

      analyzePrincipalAndCreateConnections(nodes, views);
      return nodes;
    } catch (e) {
      print("Erro ao inicializar gráfico: $e");
      return [];
    }
  }

  Future<List<NodeInput>> analyzePrincipalAndCreateConnections(
    List<NodeInput> nodes,
    List<ViewClass> views,
  ) async {
    try {
      final principal = views.firstWhere(
        (v) => v.principal == true,
        orElse: () => throw Exception("Nenhuma view principal encontrada"),
      );
      final Set<int> analyzedPages = <int>{};
      nodes = await _analyzePageRecursively(
        principal.id!,
        analyzedPages,
        nodes,
        views,
      );
      return nodes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<NodeInput>> _analyzePageRecursively(
    int pageId,
    Set<int> analyzedPages,
    List<NodeInput> nodes,
    List<ViewClass> views,
  ) async {
    if (analyzedPages.contains(pageId)) {
      return nodes;
    }

    analyzedPages.add(pageId);
    try {
      final url = Uri.parse(ApiConstants.getView(pageId.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final Set<int> referencedPages = await _findReferencedPages(
          data,
          views,
        );

        for (final referencedPageId in referencedPages) {
          final existingNode = nodes.firstWhereOrNull(
            (n) => n.id == referencedPageId.toString(),
          );
          if (existingNode == null) {
            nodes.add(
              NodeInput(
                id: referencedPageId.toString(),
                size: const NodeSize(width: 150, height: 300),
                next: [],
              ),
            );
          }
          final sourceNode = nodes.firstWhere((n) => n.id == pageId.toString());
          sourceNode.next.add(
            EdgeInput(
              outcome: referencedPageId.toString(),
              type: EdgeArrowType.one,
            ),
          );

          nodes = await _analyzePageRecursively(
            referencedPageId,
            analyzedPages,
            nodes,
            views,
          );
        }
      }
      return nodes;
    } catch (e) {
      return nodes;
    }
  }

  Future<Set<int>> _findReferencedPages(
    Map<String, dynamic> data,
    List<ViewClass> views,
  ) async {
    final Set<int> referencedPages = <int>{};

    void findNavigatePageCalls(dynamic widget) {
      if (widget is Map<String, dynamic>) {
        if (widget["args"] != null && widget["args"]["onPressed"] != null) {
          final onPressed = widget["args"]["onPressed"].toString();

          final navigatePageRegex = RegExp(
            r'''\$\{navigatePage\(['"](\d+)['"],\s*client\)\}''',
          );

          final navigatePageMatches = navigatePageRegex.allMatches(onPressed);

          for (final match in navigatePageMatches) {
            final pageId = int.tryParse(match.group(1) ?? "");
            if (pageId != null) {
              referencedPages.add(pageId);
            }
          }

          final navigateRegex = RegExp(
            r'''navigate\s*\(\s*["']([^"']+)["']\s*\);?''',
          );

          final navigateMatches = navigateRegex.allMatches(onPressed);

          for (final match in navigateMatches) {
            final pageName = match.group(1) ?? "";
            final pageId = _findPageIdByName(pageName, views);
            if (pageId != null) {
              referencedPages.add(pageId);
            }
          }
        }

        if (widget["args"] != null && widget["args"]["children"] != null) {
          final children = widget["args"]["children"];
          if (children is List) {
            for (final child in children) {
              findNavigatePageCalls(child);
            }
          }
        }

        if (widget["args"] != null && widget["args"]["child"] != null) {
          findNavigatePageCalls(widget["args"]["child"]);
        }
      }
    }

    if (data["scaffoldData"] != null) {
      findNavigatePageCalls(data["scaffoldData"]);
    }

    return referencedPages;
  }

  int? _findPageIdByName(String pageName, List<ViewClass> views) {
    try {
      final view = views.firstWhere(
        (v) =>
            v.titulo?.toLowerCase() == pageName.toLowerCase() ||
            v.id.toString() == pageName,
        orElse: () => throw Exception("Página não encontrada"),
      );

      return view.id;
    } catch (e) {
      return null;
    }
  }

  Future<String> loadJson(int pageID) async {
    try {
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return jsonEncode(data["scaffoldData"]);
      } else {
        return "Erro HTTP: ${response.statusCode}";
      }
    } catch (e) {
      return "Erro: $e";
    }
  }

  Future<JsonWidgetData?> loadScaffold(
    int pageID,
    JsonWidgetRegistry registry,
  ) async {
    try {
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final scaffoldDataJson = jsonEncode(data["scaffoldData"]);
        final processedScaffoldData = await CuringaService.replaceCuringa(
          scaffoldDataJson,
        );
        final processedData = jsonDecode(processedScaffoldData);
        return JsonWidgetData.fromDynamic(processedData, registry: registry);
      } else {
        return null;
      }
    } catch (e) {
      print("[loadScaffold] Erro: $e");
      return null;
    }
  }
}
