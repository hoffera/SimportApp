import "package:json_app/main.dart";
import "package:json_app/src/data/services/client_service.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:mobx/mobx.dart";

import "../models/client/client.dart";

part "client_store.g.dart";

class ClientStore = _ClientStore with _$ClientStore;

abstract class _ClientStore with Store {
  @observable
  ClientModel? selectedClient;

  @observable
  List<ClientModel> clientList = ObservableList<ClientModel>();

  @observable
  ClientStoreState state = ClientStoreState.loading;

  @computed
  int get lengthClientList => clientList.length;

  @computed
  bool get uniqueClient => lengthClientList == 1;

  @computed
  bool get isEmptyClientList => clientList.isEmpty;

  @action
  void setSelectedClient(ClientModel? client) {
    if (client == null) {
      selectedClient = null;
    } else {
      selectedClient = client;
    }
  }

  @action
  Future<void> selectClientById(String clientId) async {
    state = ClientStoreState.loading;
    try {
      final language = getIt<LanguageStore>().currentLocale.languageCode;
      selectedClient = await ClientService.findById(clientId, language);

      if (selectedClient == null) {
        state = ClientStoreState.error;
        return;
      }

      setSelectedClient(selectedClient);

      state = ClientStoreState.success;
    } catch (e) {
      print("Erro ao carregar cliente: $e");
      selectedClient = null;
      state = ClientStoreState.error;
    }
  }

  @action
  void setSelectedClientByClientId(String clientId) {
    selectedClient = clientList.firstWhere(
      (client) => client.clientId == clientId,
    );
  }

  @action
  Future<void> refreshSelectedClient(String clientId) async {
    state = ClientStoreState.loading;
    try {
      final language = getIt<LanguageStore>().currentLocale.languageCode;
      selectedClient = await ClientService.findById(clientId, language);
      if (selectedClient == null) {
        state = ClientStoreState.error;
        return;
      }
      setSelectedClient(selectedClient!);
      state = ClientStoreState.success;
    } catch (e) {
      print("Erro ao atualizar cliente: $e");
      selectedClient = null;
      state = ClientStoreState.error;
    }
  }

  @action
  Future<void> loadClients() async {
    state = ClientStoreState.loading;
    try {
      final language = getIt<LanguageStore>().currentLocale.languageCode;
      clientList = await ClientService.fetchClients(language);

      if (clientList.isEmpty) {
        state = ClientStoreState.empty;
      } else {
        state = ClientStoreState.success;
      }
    } catch (e) {
      print("Erro ao carregar lista de clientes: $e");
      clientList = [];
      state = ClientStoreState.error;
    }
  }
}

enum ClientStoreState { loading, success, error, empty }
