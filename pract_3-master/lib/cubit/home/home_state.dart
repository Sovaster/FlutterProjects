part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ClickState extends HomeState
{
  int clickCount;

  ClickState(this.clickCount);
}

class FinishState extends HomeState{

}
