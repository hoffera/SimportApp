import "dart:convert";
import "dart:math";

import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:graphite/graphite.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/client/client_model.dart";
import "package:json_app/app/client/client_service.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class EditorClientPageController extends GetxController {
  EditorClientPageController(this.clientId);
  final String clientId;
  final RxInt tab = 1.obs;

  final Rx<JsonWidgetData?> appBarData = Rx<JsonWidgetData?>(null);
  final Rx<JsonWidgetData?> bodyData = Rx<JsonWidgetData?>(null);
  final Rx<JsonWidgetData?> bottomNavData = Rx<JsonWidgetData?>(null);
  final RxList<Edge> edges = <Edge>[].obs;
  final RxBool graphUpdated = false.obs;
  final RxBool isLoading = false.obs;
  final RxList<NodeInput> nodes = <NodeInput>[].obs;
  final Random r = Random();
  final registry = JsonWidgetRegistry.instance;
  List<ViewClass> views = [];
  var client = Rx<Client?>(null);
  var clients = <Client>[].obs;
  final TransformationController transformationController =
      TransformationController();

  @override
  void onInit() async {
    super.onInit();
    await _carregarCliente();
    carregarClientes();
  }

  void resetView() {
    transformationController.value = Matrix4.identity();
  }

  Future<void> _carregarCliente() async {
    try {
      isLoading.value = true;
      client.value = await ClientService.findById(clientId);

      if (client.value!.views != null) {
        views = client.value!.views!;
        print(
          "Cliente carregado: ${client.value!.nome} com ${views.length} views",
        );
        await initializeGraph();
      } else {
        print("Cliente não encontrado ou sem views: $clientId");
        views = [];
      }
    } catch (e) {
      print("Erro ao carregar cliente: $e");
      views = [];
    } finally {
      isLoading.value = false;
    }
  }

  void carregarClientes() async {
    try {
      isLoading.value = true;
      final fetchedClients = await ClientService.fetchClients();
      clients.value = fetchedClients;
    } catch (e) {
      print("Erro: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void abrirCliente(Client client) {
    if (client.views != null) {
      final context = Get.context;
      if (context != null) {
        context.go("/editor-client/${client.id}");
      }
    }
  }

  Future<void> initializeGraph() async {
    if (views.isEmpty) {
      print("Nenhuma view disponível para inicializar o gráfico");
      return;
    }
    try {
      final principal = views.firstWhere(
        (v) => v.principal == true,
        orElse: () => throw Exception("Nenhuma view principal encontrada"),
      );
      nodes.clear();
      nodes.add(
        NodeInput(
          id: principal.id.toString(),
          size: const NodeSize(width: 150, height: 300),
          next: [],
        ),
      );

      analyzePrincipalAndCreateConnections();
    } catch (e) {
      print("Erro ao inicializar gráfico: $e");
    }
  }

  Future<void> analyzePrincipalAndCreateConnections() async {
    try {
      final principal = views.firstWhere(
        (v) => v.principal == true,
        orElse: () => throw Exception("Nenhuma view principal encontrada"),
      );
      final Set<int> analyzedPages = <int>{};
      await _analyzePageRecursively(principal.id!, analyzedPages);
      graphUpdated.toggle();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> loadJson(int pageID) async {
    try {
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return jsonEncode(data["body"]);
      } else {
        return "Erro HTTP: ${response.statusCode}";
      }
    } catch (e) {
      return "Erro: $e";
    }
  }

  Future<JsonWidgetData?> loadBody(
    int pageID,
    JsonWidgetRegistry registry,
  ) async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        data["body"] = JsonWidgetData.fromDynamic(
          data["body"],
          registry: registry,
        );

        return data["body"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<JsonWidgetData?> loadAppBar(
    int pageID,
    JsonWidgetRegistry registry,
  ) async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        data["appBar"] = JsonWidgetData.fromDynamic(
          data["appBar"],
          registry: registry,
        );

        return data["appBar"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<JsonWidgetData?> loadBottomNavigationBar(
    int pageID,
    JsonWidgetRegistry registry,
  ) async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        data["bottomNavigationBar"] = JsonWidgetData.fromDynamic(
          data["bottomNavigationBar"],
          registry: registry,
        );

        return data["bottomNavigationBar"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> _analyzePageRecursively(
    int pageId,
    Set<int> analyzedPages,
  ) async {
    if (analyzedPages.contains(pageId)) {
      return;
    }

    analyzedPages.add(pageId);
    try {
      final url = Uri.parse(ApiConstants.getView(pageId.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final Set<int> referencedPages = await _findReferencedPages(data);

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

          await _analyzePageRecursively(referencedPageId, analyzedPages);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Set<int>> _findReferencedPages(Map<String, dynamic> data) async {
    final Set<int> referencedPages = <int>{};

    void findNavigatePageCalls(dynamic widget) {
      if (widget is Map<String, dynamic>) {
        if (widget["args"] != null && widget["args"]["onPressed"] != null) {
          final onPressed = widget["args"]["onPressed"].toString();

          final navigatePageRegex = RegExp(
            r'''navigatePage\s*\(\s*["']?(\d+)["']?\s*\);?''',
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
            final pageId = _findPageIdByName(pageName);
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

    if (data["appBar"] != null) {
      findNavigatePageCalls(data["appBar"]);
    }

    if (data["body"] != null) {
      findNavigatePageCalls(data["body"]);
    }

    if (data["bottomNavigationBar"] != null) {
      findNavigatePageCalls(data["bottomNavigationBar"]);
    }

    return referencedPages;
  }

  int? _findPageIdByName(String pageName) {
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

  void onTabChanged(int index) {
    tab.value = index;
  }
}
