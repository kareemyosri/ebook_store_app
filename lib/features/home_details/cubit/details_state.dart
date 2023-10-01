part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class AddToCartLoadingState extends DetailsState {}
class AddToCartSuccessfullyState extends DetailsState {}
class AddToCartErrorState extends DetailsState {}
