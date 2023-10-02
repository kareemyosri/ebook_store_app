part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class CheckoutLoading extends OrderState {}
class CheckoutSuccessfully extends OrderState {}
class CheckoutError extends OrderState {}

class GetGovernorateLoading extends OrderState {}
class GetGovernorateSuccessfully extends OrderState {}
class GetGovernorateError extends OrderState {}

class UpdateSelectedId extends OrderState {}

class PlaceOrderLoading extends OrderState {}
class PlaceOrderSuccessfully extends OrderState {}
class PlaceOrderError extends OrderState {}