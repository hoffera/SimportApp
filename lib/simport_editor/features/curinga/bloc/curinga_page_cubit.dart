import "package:flutter_bloc/flutter_bloc.dart";

part "curinga_page_states.dart";

class CuringaPageCubit extends Cubit<CuringaPageStates> {
  CuringaPageCubit() : super(CuringaPageInitial());
}
