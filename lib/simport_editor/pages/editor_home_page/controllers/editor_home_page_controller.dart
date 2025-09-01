import "package:get/get.dart";
import "package:go_router/go_router.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class EditorHomePageController extends GetxController {
  final registry = JsonWidgetRegistry.instance;

  var clients = <Client>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    carregarClientes();
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

  Future<void> abrirCliente(Client client) async {
    final getContext = Get.context;
    getContext?.go("/editor-client/${client.id}");
  }
}
