part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetSliderLoadingState extends HomeState{}
class GetSliderSuccessState extends HomeState{}
class GetSliderErrorState extends HomeState{}


class GetBestSellerLoadingState extends HomeState{}
class GetBestSellerSuccessState extends HomeState{}
class GetBestSellerErrorState extends HomeState{}

class GetNewArrivalsLoadingState extends HomeState{}
class GetNewArrivalsSuccessState extends HomeState{}
class GetNewArrivalsErrorState extends HomeState{}

class GetAllCategoriesLoadingState extends HomeState{}
class GetAllCategoriesSuccessState extends HomeState{}
class GetAllCategoriesErrorState extends HomeState{}