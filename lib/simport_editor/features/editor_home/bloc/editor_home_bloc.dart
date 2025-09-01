import "package:bloc/bloc.dart";
import "package:json_app/simport_editor/services/conexoes_services.dart";

part "editor_home_state.dart";

class EditorHomeBloc extends Cubit<EditorHomePageStates> {
  EditorHomeBloc() : super(EditorHomePageInitial());

  final ConexoesService conexoesService = ConexoesService();

  Future<void> onInit(String clientId) async {
    emit(EditorHomePageInitial());
  }
}
