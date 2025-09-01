import "package:go_router/go_router.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

sealed class EditorHomeEvent {
  Future<void> abrirCliente(Client client, BuildContext context) async {
    context.go("/editor-client/${client.id}");
  }

  Future<List<Client>> carregarClientes() async {
    try {
      final fetchedClients = await ClientService.fetchClients();
      return fetchedClients;
    } catch (e) {
      print("Erro: $e");
      return [];
    }
  }
}
