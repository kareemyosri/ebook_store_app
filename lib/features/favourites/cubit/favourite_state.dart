part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class GetFavouriteItemsLoadingState extends FavouriteState {}
class GetFavouriteItemsSuccessfullyState extends FavouriteState {}
class GetFavouriteItemsErrorState extends FavouriteState {}
