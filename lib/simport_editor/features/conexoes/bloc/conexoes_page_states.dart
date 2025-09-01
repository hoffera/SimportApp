part of "conexoes_page_cubit.dart";

abstract class ConexoesPageStates {}

class ConexoesPageInitial extends ConexoesPageStates {}

class ConexoesPageLoading extends ConexoesPageStates {}

class ConexoesPageSuccess extends ConexoesPageStates {
  ConexoesPageSuccess(this.client, this.clients, this.nodes, this.views);

  final Client client;
  final List<Client> clients;
  final List<NodeInput> nodes;
  List<ViewClass> views = [];
}

class ConexoesPageError extends ConexoesPageStates {
  ConexoesPageError(this.error);

  final String error;
}
