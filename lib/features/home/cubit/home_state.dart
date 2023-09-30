part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetSliderLoadingState extends HomeState{}
class GetSliderSuccessState extends HomeState{}
class GetSliderErrorState extends HomeState{}