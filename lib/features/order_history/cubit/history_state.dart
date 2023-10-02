part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class GetOrderHistoryLoading extends HistoryState {}
class GetOrderHistorySuccessfully extends HistoryState {}
class GetOrderHistoryError extends HistoryState {}
