part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchError extends SearchState {}

final class FilterLoading extends SearchState {}
final class FilterSuccess extends SearchState {}
final class FilterError extends SearchState {}

final class ChangeRangeValues extends SearchState {}

