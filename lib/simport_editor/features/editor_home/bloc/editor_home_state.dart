part of "editor_home_bloc.dart";

abstract class EditorHomePageStates {}

class EditorHomePageInitial extends EditorHomePageStates {}

class EditorHomePageLoading extends EditorHomePageStates {}

class EditorHomePageSuccess extends EditorHomePageStates {}

class EditorHomePageError extends EditorHomePageStates {
  EditorHomePageError(this.error);

  final String error;
}
