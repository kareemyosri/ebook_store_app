part of 'details_history_cubit.dart';

@immutable
abstract class DetailsHistoryState {}

class DetailsHistoryInitial extends DetailsHistoryState {}

class ShowOrderLoading extends DetailsHistoryState {}
class ShowOrderSuccessfully extends DetailsHistoryState {}
class ShowOrderError extends DetailsHistoryState {}
