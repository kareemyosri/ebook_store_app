part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartItemsLoadingState extends CartState {}

class GetCartItemsErrorState extends CartState {}

class GetCartItemsEmptyState extends CartState {}

class GetCartItemsSuccessfullyState extends CartState {}

class RemoveItemLoadingState extends CartState {}

class RemoveItemSuccessfullyState extends CartState {}

class RemoveItemErrorState extends CartState {}

class UpdateItemLoadingState extends CartState {}

class UpdateItemSuccessfullyState extends CartState {}

class UpdateItemErrorState extends CartState {}
