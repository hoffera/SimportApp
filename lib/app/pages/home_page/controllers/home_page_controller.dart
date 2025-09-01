import "package:get/get.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_app/app/pages/dynamic_json_page/controllers/dynamic_json_page_controller.dart";
import "package:json_app/app/pages/dynamic_json_page/views/dynamic_json_page_view.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class HomePageController extends GetxController {
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
    final view = client.views?.firstWhere(
      (v) => v.principal == true,
      orElse: () => throw Exception("Nenhuma view principal encontrada"),
    );

    final pageID = view?.id ?? 0;
    var data = view?.skeleton;

    if (data == null) {
      print("skeleton não encontrado");
      return;
    }

    final skeleton = JsonWidgetData.fromDynamic(data, registry: registry);
    if (Get.isRegistered<DynamicJsonPageController>()) {
      Get.delete<DynamicJsonPageController>();
    }
    Get.put(DynamicJsonPageController(pageID, client));
    Get.to(DynamicJsonPageView(pageID: pageID, skeleton: skeleton));
  }
}
