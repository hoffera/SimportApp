part of "editor_client_bloc.dart";

abstract class EditorClientPageStates {}

class EditorClientPageInitial extends EditorClientPageStates {}

class EditorClientPageLoading extends EditorClientPageStates {}

class EditorClientPageSuccess extends EditorClientPageStates {
  EditorClientPageSuccess(this.client, this.index);

  final Client client;
  final int index;
}

class EditorClientPageError extends EditorClientPageStates {
  EditorClientPageError(this.error);

  final String error;
}
