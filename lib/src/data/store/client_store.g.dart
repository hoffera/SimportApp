// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientStore on _ClientStore, Store {
  Computed<int>? _$lengthClientListComputed;

  @override
  int get lengthClientList => (_$lengthClientListComputed ??= Computed<int>(
    () => super.lengthClientList,
    name: '_ClientStore.lengthClientList',
  )).value;
  Computed<bool>? _$uniqueClientComputed;

  @override
  bool get uniqueClient => (_$uniqueClientComputed ??= Computed<bool>(
    () => super.uniqueClient,
    name: '_ClientStore.uniqueClient',
  )).value;
  Computed<bool>? _$isEmptyClientListComputed;

  @override
  bool get isEmptyClientList => (_$isEmptyClientListComputed ??= Computed<bool>(
    () => super.isEmptyClientList,
    name: '_ClientStore.isEmptyClientList',
  )).value;

  late final _$selectedClientAtom = Atom(
    name: '_ClientStore.selectedClient',
    context: context,
  );

  @override
  ClientModel? get selectedClient {
    _$selectedClientAtom.reportRead();
    return super.selectedClient;
  }

  @override
  set selectedClient(ClientModel? value) {
    _$selectedClientAtom.reportWrite(value, super.selectedClient, () {
      super.selectedClient = value;
    });
  }

  late final _$clientListAtom = Atom(
    name: '_ClientStore.clientList',
    context: context,
  );

  @override
  List<ClientModel> get clientList {
    _$clientListAtom.reportRead();
    return super.clientList;
  }

  @override
  set clientList(List<ClientModel> value) {
    _$clientListAtom.reportWrite(value, super.clientList, () {
      super.clientList = value;
    });
  }

  late final _$stateAtom = Atom(name: '_ClientStore.state', context: context);

  @override
  ClientStoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ClientStoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$selectClientByIdAsyncAction = AsyncAction(
    '_ClientStore.selectClientById',
    context: context,
  );

  @override
  Future<void> selectClientById(String clientId) {
    return _$selectClientByIdAsyncAction.run(
      () => super.selectClientById(clientId),
    );
  }

  late final _$refreshSelectedClientAsyncAction = AsyncAction(
    '_ClientStore.refreshSelectedClient',
    context: context,
  );

  @override
  Future<void> refreshSelectedClient(String clientId) {
    return _$refreshSelectedClientAsyncAction.run(
      () => super.refreshSelectedClient(clientId),
    );
  }

  late final _$loadClientsAsyncAction = AsyncAction(
    '_ClientStore.loadClients',
    context: context,
  );

  @override
  Future<void> loadClients() {
    return _$loadClientsAsyncAction.run(() => super.loadClients());
  }

  late final _$_ClientStoreActionController = ActionController(
    name: '_ClientStore',
    context: context,
  );

  @override
  void setSelectedClient(ClientModel? client) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
      name: '_ClientStore.setSelectedClient',
    );
    try {
      return super.setSelectedClient(client);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedClientByClientId(String clientId) {
    final _$actionInfo = _$_ClientStoreActionController.startAction(
      name: '_ClientStore.setSelectedClientByClientId',
    );
    try {
      return super.setSelectedClientByClientId(clientId);
    } finally {
      _$_ClientStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedClient: ${selectedClient},
clientList: ${clientList},
state: ${state},
lengthClientList: ${lengthClientList},
uniqueClient: ${uniqueClient},
isEmptyClientList: ${isEmptyClientList}
    ''';
  }
}
