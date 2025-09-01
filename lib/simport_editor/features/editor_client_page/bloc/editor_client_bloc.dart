import "package:bloc/bloc.dart";
import "package:json_app/app/models/client/client_model.dart";
import "package:json_app/app/models/client/client_service.dart";
import "package:json_app/simport_editor/features/editor_client_page/bloc/editor_client_event.dart";

part "editor_client_state.dart";

class EditorClientBloc extends Cubit<EditorClientPageStates> {
  EditorClientBloc() : super(EditorClientPageInitial());

  Client? _client;

  Future<void> onInit(String clientId) async {
    emit(EditorClientPageLoading());
    try {
      _client = await ClientService.findById(clientId);
      EditorClientEvent.setupCustomVariables();
      emit(EditorClientPageSuccess(_client!, 0));
    } catch (e) {
      emit(EditorClientPageError("Não foi possível carregar os dados!"));
    }
  }

  Future<void> onTabChange(int index) async {
    if (_client == null) {
      emit(EditorClientPageError("Cliente não carregado!"));
      return;
    }

    emit(EditorClientPageSuccess(_client!, index));
  }
}
