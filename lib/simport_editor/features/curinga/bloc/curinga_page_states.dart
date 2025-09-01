part of "curinga_page_cubit.dart";

abstract class CuringaPageStates {}

class CuringaPageInitial extends CuringaPageStates {}

class CuringaPageLoading extends CuringaPageStates {}

class CuringaPageSuccess extends CuringaPageStates {}

class HomeError extends CuringaPageStates {
  HomeError(this.error);

  final String error;
}
