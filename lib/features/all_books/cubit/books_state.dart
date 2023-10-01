part of 'books_cubit.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}

class GetAllBooksLoadingState extends BooksState {}
class GetAllBooksSuccessfullyState extends BooksState {}
class GetAllBooksErrorState extends BooksState {}
