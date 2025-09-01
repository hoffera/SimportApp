import "dart:convert";

import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:graphite/graphite.dart";
import "package:http/http.dart" as http;
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_app/app/models/curinga/curinga_service.dart";
import "package:json_app/config/api_constants.dart";
import "package:json_app/simport_editor/widgets/device_preview/device_preview.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class TelasPage extends StatefulWidget {
  final String clientId;
  const TelasPage({super.key, required this.clientId});

  @override
  State<TelasPage> createState() => _TelasPageState();
}

class _TelasPageState extends State<TelasPage> {
  final RxBool graphUpdated = false.obs;
  final RxList<NodeInput> nodes = <NodeInput>[].obs;
  final TransformationController transformationController =
      TransformationController();
  var clients = <Client>[].obs;
  var client = Rx<Client?>(null);
  final RxBool isLoading = false.obs;
  List<ViewClass> views = [];
  final registry = JsonWidgetRegistry.instance;

  @override
  void initState() {
    super.initState();

    _carregarCliente();
  }

  Future<void> _carregarCliente() async {
    try {
      isLoading.value = true;
      final loadedClient = await ClientService.findById(widget.clientId);
      if (loadedClient == null) {
        print(
          "[_carregarCliente] Cliente não encontrado para o id: ${widget.clientId}",
        );
      }
      client.value = loadedClient;
    } catch (e) {
      print("[_carregarCliente] Erro: $e");
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
      print("[carregarClientes] Erro: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Obx(() {
            if (client.value == null) {
              return const SizedBox.shrink();
            }

            final views = client.value!.views;
            if (views == null || views.isEmpty) {
              return const Center(
                child: Text("Nenhuma tela encontrada para este cliente."),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: views
                      .map(
                        (page) => Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SizedBox(
                            height: 500,
                            width: 500,
                            child: FutureBuilder<Widget>(
                              future: _scaffoldJson(context, page.id, 6),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const SizedBox.shrink();
                                }
                                if (snapshot.hasError) {
                                  print(
                                    "[build] Erro ao carregar tela: ${snapshot.error}",
                                  );
                                  return Center(
                                    child: Text("Erro ao carregar tela."),
                                  );
                                }
                                if (snapshot.data == null) {
                                  print(
                                    "[build] Valor nulo retornado para a tela de id: ${page.id}",
                                  );
                                  return Center(
                                    child: Text("Tela não encontrada (null)."),
                                  );
                                }
                                return snapshot.data!;
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void resetView() {
    transformationController.value = Matrix4.identity();
  }

  Future<JsonWidgetData?> loadScaffold(
    int pageID,
    JsonWidgetRegistry registry,
  ) async {
    try {
      isLoading.value = true;
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data == null || data["scaffoldData"] == null) {
          print(
            "[loadScaffold] Valor nulo recebido do backend para pageID: $pageID",
          );
          return null;
        }
        final scaffoldDataJson = jsonEncode(data["scaffoldData"]);
        final processedScaffoldData = await CuringaService.replaceCuringa(
          scaffoldDataJson,
        );
        final processedData = jsonDecode(processedScaffoldData);
        return JsonWidgetData.fromDynamic(processedData, registry: registry);
      } else {
        print(
          "[loadScaffold] Erro HTTP: ${response.statusCode} para pageID: $pageID",
        );
        return null;
      }
    } catch (e) {
      print("[loadScaffold] Erro: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<Widget> _scaffoldJson(
    BuildContext context,
    int? pageID,
    int principal,
  ) async {
    if (pageID == null) {
      print("[_scaffoldJson] pageID é null");
      return const SizedBox.shrink();
    }
    final scaffoldData = await loadScaffold(pageID, registry);

    if (scaffoldData == null) {
      print("[_scaffoldJson] scaffoldData retornou null para pageID: $pageID");
    }

    return RepaintBoundary(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "ID: ${pageID.toString()}",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: () async {
                try {
                  final json = await loadJson(pageID);
                  final jsondata = await CuringaService.replaceCuringa(json);
                  if (context.mounted) {
                    final bytes = utf8.encode(jsondata);
                    final base64Json = base64.encode(bytes);
                    context.go("/code-json/$base64Json/${widget.clientId}");
                  }
                } catch (e) {
                  print("[_scaffoldJson] DEBUG: Error loading JSON: $e");
                }
              },
              child: AbsorbPointer(
                child: DevicePreview(
                  screen:
                      scaffoldData?.build(context: context) ??
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> loadJson(int pageID) async {
    try {
      final url = Uri.parse(ApiConstants.getView(pageID.toString()));
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data == null || data["scaffoldData"] == null) {
          print(
            "[loadJson] Valor nulo recebido do backend para pageID: $pageID",
          );
          return "Erro: Dados nulos recebidos do backend";
        }
        return jsonEncode(data["scaffoldData"]);
      } else {
        print(
          "[loadJson] Erro HTTP: ${response.statusCode} para pageID: $pageID",
        );
        return "Erro HTTP: ${response.statusCode}";
      }
    } catch (e) {
      print("[loadJson] Erro: $e");
      return "Erro: $e";
    }
  }
}
