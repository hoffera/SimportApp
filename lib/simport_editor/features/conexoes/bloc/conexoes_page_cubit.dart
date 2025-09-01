import "package:bloc/bloc.dart";
import "package:graphite/core/typings.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_app/simport_editor/services/conexoes_services.dart";

part "conexoes_page_states.dart";

class ConexoesPageCubit extends Cubit<ConexoesPageStates> {
  ConexoesPageCubit() : super(ConexoesPageInitial());

  final ConexoesService conexoesService = ConexoesService();

  Future<void> onInit(String clientId) async {
    emit(ConexoesPageLoading());
    try {
      Client? client = await ClientService.findById(clientId);
      List<NodeInput> nodes = await conexoesService.initializeGraph(
        client!.views!,
      );

      nodes = await conexoesService.analyzePrincipalAndCreateConnections(
        nodes,
        client.views!,
      );

      List<Client> clients = await ClientService.fetchClients();

      emit(ConexoesPageSuccess(client, clients, nodes, client.views!));
    } catch (e) {
      emit(ConexoesPageError("Não foi possível carregar os dados!"));
    }
  }
}
