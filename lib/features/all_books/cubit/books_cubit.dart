import 'package:bloc/bloc.dart';
import 'package:book_store_app/core/database/remoteDatabase/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/database/remoteDatabase/DioHelper.dart';
import '../../home/model/productModel.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  static BooksCubit get(context) => BlocProvider.of(context);

  List<Products> allBooks = [];

  void getAllBooks() {
    emit(GetAllBooksLoadingState());
    DioHelper.getData(url: getAllBooksUrl).then((value) {
      //print(value.data);

      for (var element in value.data['data']['products']) {
        allBooks.add(Products.fromJson(element));
      }
      emit(GetAllBooksSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllBooksErrorState());
    });
  }
}


